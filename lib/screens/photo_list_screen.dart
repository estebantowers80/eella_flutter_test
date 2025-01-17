import 'package:eela_flutter_test/models/photos_public_model.dart';
import 'package:eela_flutter_test/services/photos_public_service.dart';
import 'package:eela_flutter_test/widgets/photo_card.dart';
import 'package:flutter/material.dart';

class PhotoListScreen extends StatefulWidget {
  const PhotoListScreen({super.key});
  //nombre de pantalla
  static const routeName = "/";

  @override
  State<PhotoListScreen> createState() => _PhotoListScreenState();
}

class _PhotoListScreenState extends State<PhotoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EELA FLUTTER TEST'),
        backgroundColor: const Color(0xFF2D1A63),
        titleTextStyle: const TextStyle(
          color: Color(0xFFF6EAC4),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.photo_album),
            color: Colors.orange,
            iconSize: 40,
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Lista de imágenes"),
            ),
            //mande a imprimir la siguiente foto por que el servicio estaba dando error por demaciados llamados y no se podia probar 
            const PhotoCard(
              imageUrl: "https://i.blogs.es/0ca9a6/aa/1366_2000.jpeg",
              tags:
                  "cortemadera marin marincounty modernsunsets priime priimephotowalk vintagecars vintagecarsandmodernsunsets licenseplate",
            ),
            Expanded(
              child: FutureBuilder(
                future: PhotosPublicService().getPhotos(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return Text(
                      "Ha ocurrido un error al cargar los datos: ${snapshot.error}",
                    );
                  }
                  final data = snapshot.data as List<PhotosPublicModel>;
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final datoFila = data[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //llamamos al widget que genera la imagen
                              PhotoCard(
                                imageUrl:
                                    datoFila.media.m,
                                tags:
                                    datoFila.tags,
                              ),
                              //lo siguiente era para probar como llegaban los campos se documenta
                              // Text(
                              //   'Link: ${datoFila.media.m}',
                              //   style: const TextStyle(
                              //       fontSize: 16, fontWeight: FontWeight.bold),
                              // ),
                              // const SizedBox(height: 4),
                              // Text('Tags: ${datoFila.tags}'),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
