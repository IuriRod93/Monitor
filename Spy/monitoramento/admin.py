from django.contrib import admin
from .models import (
    Dispositivo, Atividade, Localizacao, Contato, SMS, Chamada,
    Aplicativo, Arquivo, Midia, RedeSocial, AtividadeRede
)

@admin.register(Dispositivo)
class DispositivoAdmin(admin.ModelAdmin):
    list_display = ['imei', 'nome', 'usuario', 'ip', 'status', 'ultima_conexao']
    list_filter = ['status', 'sistema_operacional', 'departamento']
    search_fields = ['imei', 'nome', 'usuario', 'ip']
    readonly_fields = ['criado_em', 'ultima_conexao']

@admin.register(Atividade)
class AtividadeAdmin(admin.ModelAdmin):
    list_display = ['dispositivo', 'descricao', 'data_hora']
    list_filter = ['data_hora']
    search_fields = ['dispositivo__imei', 'descricao']

@admin.register(Localizacao)
class LocalizacaoAdmin(admin.ModelAdmin):
    list_display = ['dispositivo', 'latitude', 'longitude', 'data_hora']
    list_filter = ['data_hora']
    search_fields = ['dispositivo__imei']

@admin.register(Contato)
class ContatoAdmin(admin.ModelAdmin):
    list_display = ['dispositivo', 'nome', 'telefone', 'data_coleta']
    list_filter = ['data_coleta']
    search_fields = ['nome', 'telefone', 'dispositivo__imei']

@admin.register(SMS)
class SMSAdmin(admin.ModelAdmin):
    list_display = ['dispositivo', 'remetente', 'destinatario', 'tipo', 'data_envio']
    list_filter = ['tipo', 'data_envio', 'data_coleta']
    search_fields = ['remetente', 'destinatario', 'mensagem']

@admin.register(Chamada)
class ChamadaAdmin(admin.ModelAdmin):
    list_display = ['dispositivo', 'numero', 'tipo', 'duracao', 'data_chamada']
    list_filter = ['tipo', 'data_chamada']
    search_fields = ['numero', 'dispositivo__imei']

@admin.register(Aplicativo)
class AplicativoAdmin(admin.ModelAdmin):
    list_display = ['dispositivo', 'nome', 'pacote', 'versao', 'data_coleta']
    list_filter = ['data_coleta']
    search_fields = ['nome', 'pacote', 'dispositivo__imei']

@admin.register(Arquivo)
class ArquivoAdmin(admin.ModelAdmin):
    list_display = ['dispositivo', 'nome_arquivo', 'tipo_arquivo', 'tamanho', 'data_upload']
    list_filter = ['tipo_arquivo', 'data_upload']
    search_fields = ['nome_arquivo', 'dispositivo__imei']

@admin.register(Midia)
class MidiaAdmin(admin.ModelAdmin):
    list_display = ['dispositivo', 'nome_arquivo', 'tipo_midia', 'tamanho', 'data_upload']
    list_filter = ['tipo_midia', 'data_upload']
    search_fields = ['nome_arquivo', 'dispositivo__imei']

@admin.register(RedeSocial)
class RedeSocialAdmin(admin.ModelAdmin):
    list_display = ['dispositivo', 'nome_app', 'pacote', 'instalado', 'ultima_atividade']
    list_filter = ['instalado', 'nome_app']
    search_fields = ['nome_app', 'pacote', 'dispositivo__imei']

@admin.register(AtividadeRede)
class AtividadeRedeAdmin(admin.ModelAdmin):
    list_display = ['dispositivo', 'ip_local', 'ip_publico', 'wifi_ssid', 'data_coleta']
    list_filter = ['data_coleta']
    search_fields = ['ip_local', 'ip_publico', 'wifi_ssid', 'dispositivo__imei']
