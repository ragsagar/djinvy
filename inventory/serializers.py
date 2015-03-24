from rest_framework import serializers

from .models import (InventoryItem, InventoryType, Manufacturer,
                     InMovement, OutMovement)


class InventoryItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = InventoryItem
        fields = ['code', 'name', 'type', 'description', 'type',
                  'manufacturer', 'size']
        read_only_fields = ['created', 'created_by', 'pk']


class InventoryTypeSerializer(serializers.ModelSerializer):
    class Meta:
        model = InventoryType
        fields = ['name']
        read_only_fields = ['created', 'created_by', 'pk']


class ManufacturerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Manufacturer
        fields = ['name']
        read_only_fields = ['created', 'created_by', 'pk']


class InMovementSerializer(serializers.ModelSerializer):
    class Meta:
        model = InMovement
        fields = ['date', 'quantity', 'total_price', 'inventory']
        read_only_fields = ['created', 'created_by', 'pk']

        
class OutMovementSerializer(serializers.ModelSerializer):
    class Meta:
        model = OutMovement
        fields = ['date', 'quantity', 'total_price', 'inventory']
        read_only_fields = ['created', 'created_by', 'pk']
