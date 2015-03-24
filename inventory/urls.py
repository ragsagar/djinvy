from django.conf.urls import patterns, url

from .views import (InventoryItemListAPIView, InventoryItemDetailAPIView,
                    InMovementListAPIView, OutMovementListAPIView)


urlpatterns = patterns('',
                       url(r'^items/$',
                           InventoryItemListAPIView.as_view(),
                           name='inventory_items_api'),
                       url(r'^items/(?P<pk>\d+)/$',
                           InventoryItemDetailAPIView.as_view(),
                           name='inventory_items_detail_api'),
                       url(r'^in_movements/$',
                           InMovementListAPIView.as_view(),
                           name='in_movements_api'),
                       url(r'^out_movements/$',
                           OutMovementListAPIView.as_view(),
                           name='out_movements_api'),
                       )
