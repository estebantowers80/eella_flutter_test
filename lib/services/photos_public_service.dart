// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:eela_flutter_test/models/photos_public_model.dart';

/// Clase encargada de manejar
/// las solicitudes relacionadas con fotos públicas utilizando la API de Flickr.
class PhotosPublicService {
  /// Instancia de [Dio] para realizar solicitudes HTTP.
  final dio = Dio();

  /// Método para obtener una lista de  PhotosPublicModel desde el servicio público de fotos.
  ///
  /// Realiza una solicitud GET a la API de Flickr para obtener las fotos públicas.
  ///
  /// - Endpoint utilizado:
  /// `https://api.flickr.com/services/feeds/photos_public.gne?tags=priime&format=json&nojsoncallback=1`
  ///
  /// - Retorna:
  ///   - Una lista de [PhotosPublicModel] si los datos son recuperados exitosamente.
  ///   - Una lista vacía si no se recuperan datos o si ocurre un error.
  ///
  /// - Manejo de excepciones:
  ///   - Captura [DioException] para gestionar errores de conexión.

  // Get del servicio
  Future<List<PhotosPublicModel>> getPhotos() async {
    try {
      // Respuesta de la API
      final response = await dio.get(
        'https://api.flickr.com/services/feeds/photos_public.gne?tags=priime&format=json&nojsoncallback=1',
      );

      // Verifica si la respuesta contiene datos
      if (response.data == null) {
        return [];
      }

      // Convierte la respuesta en una lista de [PhotosPublicModel]
      final List<PhotosPublicModel> services = (response.data as List)
          .map(
            (service) => PhotosPublicModel.fromJson(service),
          )
          .toList();

      return services;
    } on DioException catch (e) {
      print(e.error);
      print(e.message);
      print(e);
      // Manejo de errores de conexión
      if (e.type == DioExceptionType.connectionError) {
        print("timeout");
      }
      return [];
    }
    catch(e){
      return[];
    }
  }

  // Future<List<PhotosPublicModel>> getServices() async {
  //   const int maxRetries = 3; // Máximo número de reintentos
  //   const int retryDelay = 1000; // Retraso inicial en milisegundos
  //   int retries = 0;

  //   while (retries < maxRetries) {
  //     try {
  //       // Realiza la solicitud GET a la API
  //       final response = await dio.get(
  //         'https://api.flickr.com/services/feeds/photos_public.gne?tags=priime&format=json&nojsoncallback=1',
  //       );

  //       // Verifica si la respuesta tiene un código 429
  //       if (response.statusCode == 429) {
  //         print(
  //             'error 429  se vuelve a intentar ${retryDelay * (retries + 1)}ms...');
  //         await Future.delayed(
  //             Duration(milliseconds: retryDelay * (retries + 1)));
  //         retries++;
  //         continue;
  //       }

  //       // Si la respuesta es exitosa, convierte los datos a una lista de PhotosPublicModel
  //       if (response.data != null) {
  //         final List<PhotosPublicModel> services = (response.data as List)
  //             .map((service) => PhotosPublicModel.fromJson(service))
  //             .toList();

  //         return services;
  //       }
  //       return [];
  //     } on DioException catch (e) {
  //       print('DioException: ${e.message}');
  //       if (e.type == DioExceptionType.connectionError) {
  //         print('Error de conexión');
  //       } else {
  //         // Detén los reintentos para errores diferentes a 429 o problemas de conexión
  //         break;
  //       }
  //     } catch (e) {
  //       print('error inesperado: $e');
  //       break;
  //     }
  //   }

  //   // Si llega aquí, se alcanzaron los reintentos máximos o ocurrió un error irrecuperable
  //   print('Max retries reached or error encountered.');
  //   return [];
  // }


}
