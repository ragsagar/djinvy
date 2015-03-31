from rest_framework import serializers

from .models import (InventoryItem, InventoryType, Manufacturer,
                     InMovement, OutMovement)


class InventoryItemSerializer(serializers.ModelSerializer):
    type_name = serializers.ReadOnlyField(source='type.name')
    manufacturer_name = serializers.ReadOnlyField(source='manufacturer.name')
    
    class Meta:
        model = InventoryItem
        fields = ['code', 'type', 'description', 'type',
                  'manufacturer', 'size', 'created', 'created_by',
                  'pk', 'type_name', 'manufacturer_name']
        read_only_fields = ['created', 'created_by', 'pk']


class InventoryTypeSerializer(serializers.ModelSerializer):

    def validate_name(self, value):
        if InventoryType.objects.filter(name__iexact=value):
            raise serializers.ValidationError(
                "Type with same name already exists. Please check again")
        return value
    
    class Meta:
        model = InventoryType
        fields = ['name', 'created', 'created_by', 'pk']
        read_only_fields = ['created', 'created_by', 'pk']


class ManufacturerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Manufacturer
        fields = ['name', 'created', 'created_by', 'pk']
        read_only_fields = ['created', 'created_by', 'pk']


class InMovementSerializer(serializers.ModelSerializer):
    class Meta:
        model = InMovement
        fields = ['date', 'quantity', 'total_price', 'inventory',
                  'created', 'created_by', 'pk']
        read_only_fields = ['created', 'created_by', 'pk']

        
class OutMovementSerializer(serializers.ModelSerializer):
    class Meta:
        model = OutMovement
        fields = ['date', 'quantity', 'total_price', 'inventory',
                  'created', 'created_by', 'pk']
        read_only_fields = ['created', 'created_by', 'pk']
