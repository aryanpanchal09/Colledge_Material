from django.contrib import admin
from django.urls import include, path
from ApaniNewz import views

urlpatterns = [
    path('', views.home, name= 'index'),
    path('login', views.login_view, name= 'login'),
    path('accounts/logout',views.logout_view, name='logout'),
    path('Registration', views.register_view, name= 'registration'),
    
    path('Details', views.News_Detail, name= 'details'),
    path('Contact', views.Contact, name= 'contact'),





]