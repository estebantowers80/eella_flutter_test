import 'package:flutter/material.dart';

class PhotoCard extends StatelessWidget {
  final String imageUrl;
  final String tags;

  // Constructor que recibe los parámetros
  const PhotoCard({
    super.key,
    required this.imageUrl,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Imagen

        FadeInImage(
          image: NetworkImage(imageUrl),
          placeholder: const AssetImage("assets/images/loading2.gif"),
          width: 500,
          fit: BoxFit.contain,
        ),

        const SizedBox(height: 8), // Espaciado entre la imagen y los tags

        // Mostrar los tags con una línea debajo
        const Text(
          "Tags:",
          style: TextStyle(fontSize: 12, color: Colors.red),
        ),
        Text(
          tags,
          style: const TextStyle(fontSize: 12, color: Colors.black45),
          textAlign: TextAlign.center,
        ),
        const Divider(color: Colors.black), // Línea debajo de los tags
      ],
    );
  }
}
