from django.db import models
import json


class Dispositivo(models.Model):
	imei = models.CharField(max_length=20, unique=True)
	ip = models.GenericIPAddressField()
	gateway = models.GenericIPAddressField(blank=True, null=True)
	mascara_rede = models.CharField(max_length=20, blank=True)
	nome = models.CharField(max_length=100, blank=True)
	usuario = models.CharField(max_length=100, blank=True)
	modelo = models.CharField(max_length=100, blank=True)
	departamento = models.CharField(max_length=100, blank=True)
	sistema_operacional = models.CharField(max_length=50, blank=True)
	status = models.CharField(max_length=20, choices=[('ativo', 'Ativo'), ('inativo', 'Inativo')], default='ativo')
	data_aquisicao = models.DateField(null=True, blank=True)
	criado_em = models.DateTimeField(auto_now_add=True)
	ultima_conexao = models.DateTimeField(auto_now=True)

	def save(self, *args, **kwargs):
		import re
		# Limpar IMEI removendo todos os caracteres não numéricos
		self.imei = re.sub(r'[^0-9]', '', str(self.imei))
		super().save(*args, **kwargs)

	def __str__(self):
		return f"{self.nome or self.imei} ({self.ip})"

class Atividade(models.Model):
	dispositivo = models.ForeignKey(Dispositivo, on_delete=models.CASCADE, related_name='atividades')
	descricao = models.TextField()
	data_hora = models.DateTimeField(auto_now_add=True)

	def __str__(self):
		return f"{self.dispositivo} - {self.data_hora}"

class Localizacao(models.Model):
	dispositivo = models.ForeignKey(Dispositivo, on_delete=models.CASCADE, related_name='localizacoes')
	latitude = models.FloatField()
	longitude = models.FloatField()
	data_hora = models.DateTimeField(auto_now_add=True)

	def __str__(self):
		return f"{self.dispositivo} - {self.latitude}, {self.longitude}"

class Contato(models.Model):
	dispositivo = models.ForeignKey(Dispositivo, on_delete=models.CASCADE, related_name='contatos')
	nome = models.CharField(max_length=200)
	telefone = models.CharField(max_length=20)
	data_coleta = models.DateTimeField(auto_now_add=True)

	class Meta:
		unique_together = ['dispositivo', 'telefone']

	def __str__(self):
		return f"{self.nome} - {self.telefone}"

class SMS(models.Model):
	dispositivo = models.ForeignKey(Dispositivo, on_delete=models.CASCADE, related_name='sms')
	remetente = models.CharField(max_length=20)
	destinatario = models.CharField(max_length=20)
	mensagem = models.TextField()
	data_envio = models.DateTimeField()
	tipo = models.CharField(max_length=10, choices=[('enviado', 'Enviado'), ('recebido', 'Recebido')])
	data_coleta = models.DateTimeField(auto_now_add=True)

	def __str__(self):
		return f"{self.remetente} -> {self.destinatario}"

class Chamada(models.Model):
	dispositivo = models.ForeignKey(Dispositivo, on_delete=models.CASCADE, related_name='chamadas')
	numero = models.CharField(max_length=20)
	tipo = models.CharField(max_length=10, choices=[('entrada', 'Entrada'), ('saida', 'Saída'), ('perdida', 'Perdida')])
	duracao = models.IntegerField(help_text='Duração em segundos')
	data_chamada = models.DateTimeField()
	data_coleta = models.DateTimeField(auto_now_add=True)

	def __str__(self):
		return f"{self.numero} - {self.tipo}"

class Aplicativo(models.Model):
	dispositivo = models.ForeignKey(Dispositivo, on_delete=models.CASCADE, related_name='aplicativos')
	nome = models.CharField(max_length=200)
	pacote = models.CharField(max_length=200)
	versao = models.CharField(max_length=50, blank=True)
	data_instalacao = models.DateTimeField(null=True, blank=True)
	data_coleta = models.DateTimeField(auto_now_add=True)

	class Meta:
		unique_together = ['dispositivo', 'pacote']

	def __str__(self):
		return f"{self.nome} ({self.pacote})"

class Arquivo(models.Model):
	dispositivo = models.ForeignKey(Dispositivo, on_delete=models.CASCADE, related_name='arquivos')
	nome_arquivo = models.CharField(max_length=255)
	caminho = models.TextField()
	tamanho = models.BigIntegerField(help_text='Tamanho em bytes')
	tipo_arquivo = models.CharField(max_length=50)
	arquivo = models.FileField(upload_to='uploads/%Y/%m/%d/', null=True, blank=True)
	data_upload = models.DateTimeField(auto_now_add=True)

	def __str__(self):
		return f"{self.nome_arquivo}"

class Midia(models.Model):
	dispositivo = models.ForeignKey(Dispositivo, on_delete=models.CASCADE, related_name='midias')
	nome_arquivo = models.CharField(max_length=255)
	tipo_midia = models.CharField(max_length=20, choices=[('foto', 'Foto'), ('video', 'Vídeo'), ('audio', 'Áudio')])
	tamanho = models.BigIntegerField(help_text='Tamanho em bytes')
	arquivo = models.FileField(upload_to='midias/%Y/%m/%d/')
	data_criacao = models.DateTimeField(null=True, blank=True)
	data_upload = models.DateTimeField(auto_now_add=True)
	localização = models.CharField(max_length=500, blank=True)

	def __str__(self):
		return f"{self.nome_arquivo} ({self.tipo_midia})"

class RedeSocial(models.Model):
	dispositivo = models.ForeignKey(Dispositivo, on_delete=models.CASCADE, related_name='redes_sociais')
	nome_app = models.CharField(max_length=100)
	pacote = models.CharField(max_length=200)
	instalado = models.BooleanField(default=True)
	ultima_atividade = models.DateTimeField(null=True, blank=True)
	data_coleta = models.DateTimeField(auto_now_add=True)

	class Meta:
		unique_together = ['dispositivo', 'pacote']

	def __str__(self):
		return f"{self.nome_app} - {self.dispositivo}"

class AtividadeRede(models.Model):
	dispositivo = models.ForeignKey(Dispositivo, on_delete=models.CASCADE, related_name='atividades_rede')
	ip_local = models.GenericIPAddressField()
	ip_publico = models.GenericIPAddressField(null=True, blank=True)
	wifi_ssid = models.CharField(max_length=100, blank=True)
	wifi_status = models.CharField(max_length=50, blank=True)
	velocidade_download = models.FloatField(null=True, blank=True)
	velocidade_upload = models.FloatField(null=True, blank=True)
	data_coleta = models.DateTimeField(auto_now_add=True)

	def __str__(self):
		return f"{self.dispositivo} - {self.ip_local}"
