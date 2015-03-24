from django.shortcuts import render
from django.views.generic import CreateView, UpdateView, DetailView

from braces.views import LoginRequiredMixin
from rest_framework.generics import (RetrieveUpdateDestroyAPIView,
                                     ListCreateAPIView)

from .models import (InventoryItem, InMovement, OutMovement, Manufacturer,
                     InventoryType)
from .serializers import (InventoryItemSerializer, InMovementSerializer,
                          OutMovementSerializer, InventoryTypeSerializer,
                          ManufacturerSerializer)


class CreateInventoryView(LoginRequiredMixin, CreateView):
    """ View to create new inventory items. """
    model = InventoryItem
    fields = ('code', 'name')

    def form_valid(self, form):
        """ Save the user who is creating the inventory. """
        self.object = form.save(commit=False)
        self.object.created_by = self.request.user
        self.object.save()
        return redirect(self.object.get_absolute_url())


class UpdateInventoryView(LoginRequiredMixin, UpdateView):
    """ View to update inventory items. """
    model = InventoryItem
    fields = ('code', 'name')


class InventoryItemDetailAPIView(RetrieveUpdateDestroyAPIView):
    queryset = InventoryItem.objects.all()
    serializer_class = InventoryItemSerializer

    
class InventoryItemListAPIView(ListCreateAPIView):
    queryset = InventoryItem.objects.all()
    serializer_class = InventoryItemSerializer

    def perform_create(self, serializer):
        serializer.save(created_by=self.request.user)

    
class InMovementDetailAPIView(RetrieveUpdateDestroyAPIView):
    queryset = InMovement.objects.all()
    serializer_class = InMovementSerializer


class InMovementListAPIView(ListCreateAPIView):
    queryset = InMovement.objects.all()
    serializer_class = InMovementSerializer


class OutMovementListAPIView(ListCreateAPIView):
    queryset = OutMovement.objects.all()
    serializer_class = OutMovement


class OutMovementDetailAPIView(RetrieveUpdateDestroyAPIView):
    queryset = OutMovement.objects.all()
    serializer_class = OutMovementSerializer


class ManufacturerDetailAPIView(RetrieveUpdateDestroyAPIView):
    queryset = Manufacturer.objects.all()
    serializer_class = ManufacturerSerializer


class ManufacturerListAPIView(ListCreateAPIView):
    queryset = Manufacturer.objects.all()
    serializer_class = ManufacturerSerializer


class InventoryTypeDetailAPIView(RetrieveUpdateDestroyAPIView):
    queryset = InventoryType.objects.all()
    serializer_class = InventoryTypeSerializer

    
class InventoryTypeListAPIView(ListCreateAPIView):
    queryset = InventoryType.objects.all()
    serializer_class = InventoryTypeSerializer
    
    def perform_create(self, serializer):
        serializer.save(created_by=self.request.user)
