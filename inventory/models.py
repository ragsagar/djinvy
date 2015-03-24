from django.db import models
from django.conf import settings
from django.utils import timezone
from django.utils.encoding import force_bytes

from model_utils import Choices


class InventoryType(models.Model):
    """ Different types of inventory will be kept here. """
    created = models.DateTimeField(default=timezone.now)
    name = models.CharField(max_length=255)

    class Meta:
        ordering = ['-created']

    def __str__(self):
        return force_bytes("%s" % (self.name))

    
class Company(models.Model):
    """ Models that will store the companies. """
    created = models.DateTimeField(default=timezone.now)
    name = models.CharField(max_length=255)

    class Meta:
        ordering = ['-created']

    def __str__(self):
        return force_bytes("%s" % (self.name))
    

class InventoryItem(models.Model):
    """ Model to keep each inventory item. """
    created = models.DateTimeField(default=timezone.now)
    code = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    type = models.ForeignKey(InventoryType, related_name='inventory_items')
    manufacturer = models.ForeignKey(Manufacturer,
                                     related_name='inventory_items')
    size = models.CharField(max_length=100)
    created_by = models.ForeignKey(settings.AUTH_USER_MODEL,
                                   related_name='inventory_items')

    class Meta:
        ordering = ['-created']

    def __str__(self):
        return force_bytes("%s %s" % (self.code, self.name))

    
class InMovement(models.Model):
    """ Model for tracking in movements of an inventory item. """
    created = models.DateTimeField(default=timezone.now)
    date = models.DateField()
    quantity = models.FloatField()
    unit_price = models.DecimalField(max_digits=20, decimal_places=2)
    total_price = models.DecimalField(max_digits=20, decimal_places=2)
    inventory = models.ForeignKey(Inventory, related_name='in_movements')

    class Meta:
        ordering = ['date']

    def __str__(self):
        return force_bytes("%s %s" % (self.inventory, self.quantity))


class OutMovement(models.Model):
    """ Model for tracking out movements of an inventory item. """
    created = models.DateTimeField(default=timezone.now)
    date = models.DateField()
    quantity = models.FloatField()
    unit_price = models.DecimalField(max_digits=20, decimal_places=2)
    total_price = models.DecimalField(max_digits=20, decimal_places=2)
    inventory = models.ForeignKey(Inventory, related_name='out_movements')

    class Meta:
        ordering = ['date']
    
    def __str__(self):
        return force_bytes("%s %s" % (self.inventory, self.quantity))
