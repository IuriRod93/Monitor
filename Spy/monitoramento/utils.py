from reportlab.lib import colors
from reportlab.lib.pagesizes import letter, A4
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from reportlab.lib.units import inch
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer, Table, TableStyle, Image
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont
from io import BytesIO
from django.http import HttpResponse
from .models import Dispositivo, Localizacao, Aplicativo, Contato, SMS, Chamada
import os
from datetime import datetime

def gerar_relatorio_pdf(dispositivo):
    """
    Gera um relatório PDF completo com todos os dados do dispositivo
    """
    buffer = BytesIO()

    # Configurar documento
    doc = SimpleDocTemplate(buffer, pagesize=A4)
    styles = getSampleStyleSheet()
    story = []

    # Título do relatório
    title_style = ParagraphStyle(
        'CustomTitle',
        parent=styles['Heading1'],
        fontSize=20,
        spaceAfter=30,
        alignment=1  # Centralizado
    )

    story.append(Paragraph(f"Relatório de Monitoramento - {dispositivo.imei}", title_style))
    story.append(Spacer(1, 12))

    # Informações básicas do dispositivo
    story.append(Paragraph("Informações do Dispositivo", styles['Heading2']))
    story.append(Spacer(1, 6))

    device_data = [
        ["IMEI", dispositivo.imei or "N/A"],
        ["IP", dispositivo.ip or "N/A"],
        ["Nome", dispositivo.nome or "N/A"],
        ["Usuário", dispositivo.usuario or "N/A"],
        ["Modelo", dispositivo.modelo or "N/A"],
        ["Sistema Operacional", dispositivo.sistema_operacional or "N/A"],
        ["Status", dispositivo.status or "N/A"],
        ["Última Conexão", dispositivo.ultima_conexao.strftime("%d/%m/%Y %H:%M") if dispositivo.ultima_conexao else "N/A"]
    ]

    device_table = Table(device_data, colWidths=[2*inch, 4*inch])
    device_table.setStyle(TableStyle([
        ('BACKGROUND', (0, 0), (-1, 0), colors.grey),
        ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke),
        ('ALIGN', (0, 0), (-1, -1), 'LEFT'),
        ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),
        ('FONTSIZE', (0, 0), (-1, 0), 12),
        ('BOTTOMPADDING', (0, 0), (-1, 0), 12),
        ('BACKGROUND', (0, 1), (-1, -1), colors.beige),
        ('GRID', (0, 0), (-1, -1), 1, colors.black)
    ]))
    story.append(device_table)
    story.append(Spacer(1, 20))

    # Localizações
    if dispositivo.localizacoes.exists():
        story.append(Paragraph("Localizações Recentes", styles['Heading2']))
        story.append(Spacer(1, 6))

        localizacoes = dispositivo.localizacoes.order_by('-data_hora')[:10]
        loc_data = [["Data/Hora", "Latitude", "Longitude"]]

        for loc in localizacoes:
            loc_data.append([
                loc.data_hora.strftime("%d/%m/%Y %H:%M"),
                f"{loc.latitude:.6f}",
                f"{loc.longitude:.6f}"
            ])

        loc_table = Table(loc_data, colWidths=[2*inch, 1.5*inch, 1.5*inch])
        loc_table.setStyle(TableStyle([
            ('BACKGROUND', (0, 0), (-1, 0), colors.grey),
            ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke),
            ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
            ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),
            ('FONTSIZE', (0, 0), (-1, 0), 10),
            ('BOTTOMPADDING', (0, 0), (-1, 0), 12),
            ('BACKGROUND', (0, 1), (-1, -1), colors.lightblue),
            ('GRID', (0, 0), (-1, -1), 1, colors.black)
        ]))
        story.append(loc_table)
        story.append(Spacer(1, 20))

    # Aplicativos
    if dispositivo.aplicativos.exists():
        story.append(Paragraph("Aplicativos Instalados", styles['Heading2']))
        story.append(Spacer(1, 6))

        apps = dispositivo.aplicativos.all()[:20]  # Limitar a 20 apps
        app_data = [["Nome", "Pacote", "Versão"]]

        for app in apps:
            app_data.append([
                app.nome[:30] + "..." if len(app.nome) > 30 else app.nome,
                app.pacote[:40] + "..." if len(app.pacote) > 40 else app.pacote,
                app.versao or "N/A"
            ])

        app_table = Table(app_data, colWidths=[2*inch, 2.5*inch, 1*inch])
        app_table.setStyle(TableStyle([
            ('BACKGROUND', (0, 0), (-1, 0), colors.grey),
            ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke),
            ('ALIGN', (0, 0), (-1, -1), 'LEFT'),
            ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),
            ('FONTSIZE', (0, 0), (-1, 0), 9),
            ('BOTTOMPADDING', (0, 0), (-1, 0), 12),
            ('BACKGROUND', (0, 1), (-1, -1), colors.lightgreen),
            ('GRID', (0, 0), (-1, -1), 1, colors.black)
        ]))
        story.append(app_table)
        story.append(Spacer(1, 20))

    # Contatos
    if dispositivo.contatos.exists():
        story.append(Paragraph("Contatos", styles['Heading2']))
        story.append(Spacer(1, 6))

        contatos = dispositivo.contatos.all()[:15]  # Limitar a 15 contatos
        contato_data = [["Nome", "Telefone"]]

        for contato in contatos:
            contato_data.append([
                contato.nome[:25] + "..." if len(contato.nome) > 25 else contato.nome,
                contato.telefone
            ])

        contato_table = Table(contato_data, colWidths=[2.5*inch, 2*inch])
        contato_table.setStyle(TableStyle([
            ('BACKGROUND', (0, 0), (-1, 0), colors.grey),
            ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke),
            ('ALIGN', (0, 0), (-1, -1), 'LEFT'),
            ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),
            ('FONTSIZE', (0, 0), (-1, 0), 10),
            ('BOTTOMPADDING', (0, 0), (-1, 0), 12),
            ('BACKGROUND', (0, 1), (-1, -1), colors.lightyellow),
            ('GRID', (0, 0), (-1, -1), 1, colors.black)
        ]))
        story.append(contato_table)
        story.append(Spacer(1, 20))

    # SMS (últimas 10)
    if dispositivo.sms.exists():
        story.append(Paragraph("Mensagens SMS Recentes", styles['Heading2']))
        story.append(Spacer(1, 6))

        sms_list = dispositivo.sms.order_by('-data_coleta')[:10]
        sms_data = [["Data", "Remetente", "Mensagem"]]

        for sms in sms_list:
            sms_data.append([
                sms.data_envio.strftime("%d/%m/%Y %H:%M"),
                sms.remetente[:20] + "..." if len(sms.remetente) > 20 else sms.remetente,
                sms.mensagem[:40] + "..." if len(sms.mensagem) > 40 else sms.mensagem
            ])

        sms_table = Table(sms_data, colWidths=[1.5*inch, 1.5*inch, 2.5*inch])
        sms_table.setStyle(TableStyle([
            ('BACKGROUND', (0, 0), (-1, 0), colors.grey),
            ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke),
            ('ALIGN', (0, 0), (-1, -1), 'LEFT'),
            ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),
            ('FONTSIZE', (0, 0), (-1, 0), 8),
            ('BOTTOMPADDING', (0, 0), (-1, 0), 12),
            ('BACKGROUND', (0, 1), (-1, -1), colors.lightcyan),
            ('GRID', (0, 0), (-1, -1), 1, colors.black)
        ]))
        story.append(sms_table)
        story.append(Spacer(1, 20))

    # Chamadas (últimas 10)
    if dispositivo.chamadas.exists():
        story.append(Paragraph("Chamadas Recentes", styles['Heading2']))
        story.append(Spacer(1, 6))

        chamadas = dispositivo.chamadas.order_by('-data_coleta')[:10]
        chamada_data = [["Data", "Número", "Tipo", "Duração"]]

        for chamada in chamadas:
            chamada_data.append([
                chamada.data_chamada.strftime("%d/%m/%Y %H:%M"),
                chamada.numero,
                chamada.tipo,
                f"{chamada.duracao}s"
            ])

        chamada_table = Table(chamada_data, colWidths=[1.5*inch, 1.5*inch, 1*inch, 1*inch])
        chamada_table.setStyle(TableStyle([
            ('BACKGROUND', (0, 0), (-1, 0), colors.grey),
            ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke),
            ('ALIGN', (0, 0), (-1, -1), 'LEFT'),
            ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),
            ('FONTSIZE', (0, 0), (-1, 0), 9),
            ('BOTTOMPADDING', (0, 0), (-1, 0), 12),
            ('BACKGROUND', (0, 1), (-1, -1), colors.lightpink),
            ('GRID', (0, 0), (-1, -1), 1, colors.black)
        ]))
        story.append(chamada_table)
        story.append(Spacer(1, 20))

    # Rodapé com data de geração
    footer_style = ParagraphStyle(
        'Footer',
        parent=styles['Normal'],
        fontSize=8,
        alignment=1
    )
    story.append(Spacer(1, 30))
    story.append(Paragraph(f"Relatório gerado em {datetime.now().strftime('%d/%m/%Y %H:%M:%S')}", footer_style))

    # Gerar PDF
    doc.build(story)
    buffer.seek(0)
    return buffer

def gerar_relatorio_pdf_response(dispositivo):
    """
    Retorna HttpResponse com o PDF do relatório
    """
    buffer = gerar_relatorio_pdf(dispositivo)

    response = HttpResponse(buffer.getvalue(), content_type='application/pdf')
    response['Content-Disposition'] = f'attachment; filename="relatorio_{dispositivo.imei}_{datetime.now().strftime("%Y%m%d_%H%M%S")}.pdf"'

    return response
