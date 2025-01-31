from django.contrib import admin

from .models import Registration

# Register your models here.
@admin.register(Registration)
class UserModelAdmin(admin.ModelAdmin):
    ist_display = ('first_name','last_name','username', 'email','phone', 'profile_image','password','confirm_password')