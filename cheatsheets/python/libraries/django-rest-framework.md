# Django REST Framework


## Example

Showcase of basic setup using serializers and a POST endpoint.

- `serializers.py`
    ```python
    from rest_framework import serializers


    class GreetingRequestSerializer(serializers.Serializer):
        name = serializers.CharField(max_length=100)

    class GreetingResponseSerializer(serializers.Serializer):
        message = serializers.CharField()
    ```

- `views.py`
    ```python
    from rest_framework.views import APIView
    from rest_framework.response import Response
    from rest_framework import status
    
    from .serializers import GreetingRequestSerializer, GreetingResponseSerializer


    class HelloView(APIView):
        def post(self, request):
            input_serializer = GreetingRequestSerializer(data=request.data)
            input_serializer.is_valid(raise_exception=True)
            
            name = input_serializer.validated_data['name']
            data = {"message": f"Hello, {name}!"}
            
            output_serializer = GreetingResponseSerializer(data=data)
            output_serializer.is_valid(raise_exception=True)
            
            return Response(output_serializer.data, status=status.HTTP_200_OK)
    ```

- `urls.py`
    ```python
    from django.urls import path
    
    from .views import HelloView

    urlpatterns = [
        path('greet/', HelloView.as_view(), name='hello-world'),
    ]
    ```

## Testing

Request:

```bash
curl -X POST http://127.0.0.1:8000/greet/ \
     -H "Content-Type: application/json" \
     -d '{"name": "World"}'
```

- **Status:** `200 OK`
- **Body:**
    ```json
    {
        "message": "Hello, World!"
    }
    ```

