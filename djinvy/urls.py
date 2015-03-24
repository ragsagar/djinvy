from django.conf.urls import patterns, include, url
from django.contrib import admin

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'djinvy.views.home', name='home'),
    url(r'^inventory/', include('inventory.urls')),

    url(r'^admin/', include(admin.site.urls)),
)
