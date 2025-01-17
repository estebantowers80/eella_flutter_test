# Flutter Project: Flickr Photo Gallery

Este es un proyecto de Flutter que consume un servicio web de Flickr para mostrar fotos públicas con la etiqueta "priime". El proyecto está diseñado como parte de un trabajo para un curso y está implementado utilizando las últimas versiones de Flutter y Dart.

## Descripción

El proyecto consume el siguiente servicio web para obtener un JSON con información de fotos públicas:

[API de Flickr](https://api.flickr.com/services/feeds/photos_public.gne?tags=priime&format=json&nojsoncallback=1)

El JSON devuelto contiene información sobre las fotos, incluyendo:

- Título de la foto
- Enlace a la foto
- Imagen asociada
- Fecha de toma de la foto
- Descripción de la foto
- Fecha de publicación
- Autor de la foto
- Etiquetas de la foto

## Funcionalidades

- Consumo de la API de Flickr para obtener fotos públicas con la etiqueta "priime".
- Mostrar las imágenes con su respectivo enlace.
- Imprimir las etiquetas de cada foto debajo de la imagen.
- Pantalla que carga dinámicamente las imágenes y las etiquetas.

## Estructura del Proyecto

El proyecto sigue una arquitectura modular. La estructura de carpetas es la siguiente:

lib/ 
│ 
├── models/ # Modelos de datos 
│   └── photos_public_model.dart # Modelo para manejar la respuesta JSON de Flickr 
├── screens/ # Pantallas 
│   └── photo_list_screen.dart # Pantalla principal que muestra las imágenes y etiquetas 
├── services/ # Servicios para manejar la lógica de negocio 
│   └── photos_public_service.dart # Servicio para consumir la API de Flickr 
├── utils/ # Utilidades y configuraciones 
│    └── routes.dart # Rutas de navegación  
├── widgets/ # Componentes reutilizables  
    └── photo_card.dart # Componente para mostrar cada imagen y sus etiquetas



## Instalación

1. Clona este repositorio en tu máquina local:
   git clone https://github.com/estebantowers80/eella_flutter_test.git

2. Accede a la carpeta del proyecto:
    cd eela_flutter_test

3. Instala las dependencias del proyecto:
    flutter pub get

4. Ejecuta el proyecto:
    flutter run

## Desarrollo
El proyecto está utilizando las siguientes tecnologías:

Flutter: Framework de desarrollo para aplicaciones móviles.
Dart: Lenguaje de programación utilizado en Flutter.

## Dependencias
http: Para hacer las solicitudes HTTP a la API de Flickr.
flutter: Framework de desarrollo.
