from django.conf.urls import patterns, url

from .views import (InventoryItemListAPIView, InventoryItemDetailAPIView,
                    InMovementListAPIView, OutMovementListAPIView,
                    InventoryTypeListAPIView, InventoryTypeDetailAPIView,
                    ManufacturerListAPIView, ManufacturerDetailAPIView)


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
                       url(r'^types/$',
                           InventoryTypeListAPIView.as_view(),
                           name='inventory_types_api'),
                       url(r'^types/(?P<pk>\d+)/$',
                           InventoryTypeDetailAPIView.as_view(),
                           name='inventory_types_detail_api'),
                       url(r'^manufacturers/$',
                           ManufacturerListAPIView.as_view(),
                           name='manufacturers_api'),
                       url(r'^manufacturers/(?P<pk>\d+)/$',
                           ManufacturerDetailAPIView.as_view(),
                           name='manufacturers_detail_api'),
                       )
