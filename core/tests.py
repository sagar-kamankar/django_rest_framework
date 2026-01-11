from rest_framework.test import APITestCase
from rest_framework import status
from .models import Item

class ItemAPITestCase(APITestCase):

    def test_get_items_list(self):
        """
        Test GET /api/items/
        """
        response = self.client.get('/api/items/')
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_create_item(self):
        """
        Test POST /api/items/
        """
        data = {
            "name": "test Item",
            "desc": "test Description"
        }
        response = self.client.post('/api/items/', data, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(Item.objects.count(), 1)
        self.assertEqual(Item.objects.first().name, "Test Item")
