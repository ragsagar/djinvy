from django.shortcuts import render
from django.views.generic import TemplateView
from django.contrib.auth import login

from braces.views import LoginRequiredMixin
from rest_framework import status
from rest_framework.generics import (RetrieveUpdateDestroyAPIView,
                                     ListCreateAPIView)
from rest_framework.response import Response
from rest_auth.views import Login
from rest_auth.serializers import UserDetailsSerializer

from .models import (InventoryItem, InMovement, OutMovement, Manufacturer,
                     InventoryType)
from .serializers import (InventoryItemSerializer, InMovementSerializer,
                          OutMovementSerializer, InventoryTypeSerializer,
                          ManufacturerSerializer)

class LoginAPIView(Login):
    response_serializer = UserDetailsSerializer
    
    def login(self):
        """ Overriding to avoid creation of token. """
        self.user = self.serializer.validated_data['user']
        self.token = self.user
        login(self.request, self.user)

    def get_response(self):
        """ Return the user serialized data. """
        return Response(self.response_serializer(self.user).data,
                        status=status.HTTP_200_OK)

class InventoryHomeView(TemplateView):
    """ View that will render inventory home template. """
    template_name = 'inventory/home.html'

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
    
    def perform_create(self, serializer):
        serializer.save(created_by=self.request.user)


class OutMovementListAPIView(ListCreateAPIView):
    queryset = OutMovement.objects.all()
    serializer_class = OutMovement
    
    def perform_create(self, serializer):
        serializer.save(created_by=self.request.user)


class OutMovementDetailAPIView(RetrieveUpdateDestroyAPIView):
    queryset = OutMovement.objects.all()
    serializer_class = OutMovementSerializer


class ManufacturerDetailAPIView(RetrieveUpdateDestroyAPIView):
    queryset = Manufacturer.objects.all()
    serializer_class = ManufacturerSerializer


class ManufacturerListAPIView(ListCreateAPIView):
    queryset = Manufacturer.objects.all()
    serializer_class = ManufacturerSerializer
    
    def perform_create(self, serializer):
        serializer.save(created_by=self.request.user)


class InventoryTypeDetailAPIView(RetrieveUpdateDestroyAPIView):
    queryset = InventoryType.objects.all()
    serializer_class = InventoryTypeSerializer

    
class InventoryTypeListAPIView(ListCreateAPIView):
    queryset = InventoryType.objects.all()
    serializer_class = InventoryTypeSerializer
    
    def perform_create(self, serializer):
        serializer.save(created_by=self.request.user)
