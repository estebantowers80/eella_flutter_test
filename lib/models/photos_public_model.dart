// Modelo para manejar datos de fotos públicas de Flickr
// Para convertir JSON a modelo y viceversa:
//
// final photosPublicModel = photosPublicModelFromJson(jsonString);

import 'dart:convert';

/// Convierte una cadena JSON en una instancia de PhotosPublicModel.
PhotosPublicModel photosPublicModelFromJson(String str) =>
    PhotosPublicModel.fromJson(json.decode(str));

/// Convierte una instancia de PhotosPublicModel en una cadena JSON
String photosPublicModelToJson(PhotosPublicModel data) =>
    json.encode(data.toJson());

/// Modelo para sacar los  datos de una foto
class PhotosPublicModel {
  /// Título de la foto
  final String title;

  /// Link a la foto
  final String link;

  /// Información Media de la foto
  final Media media;

  /// Fecha en la que fue tomada la foto
  final DateTime dateTaken;

  /// Descripción de la foto
  final String description;

  /// Fecha de publicación 
  final DateTime published;

  /// Nombre del autor
  final String author;

  /// Id del autor
  final String authorId;

  /// Etiquetas asignadas a la foto 
  final String tags;

  /// Constructor principal para inicializar un objeto de tipo PhotosPublicModel.
  PhotosPublicModel({
    required this.title,
    required this.link,
    required this.media,
    required this.dateTaken,
    required this.description,
    required this.published,
    required this.author,
    required this.authorId,
    required this.tags,
  });

  /// Crea una copia del objeto actual 
  PhotosPublicModel copyWith({
    String? title,
    String? link,
    Media? media,
    DateTime? dateTaken,
    String? description,
    DateTime? published,
    String? author,
    String? authorId,
    String? tags,
  }) =>
      PhotosPublicModel(
        title: title ?? this.title,
        link: link ?? this.link,
        media: media ?? this.media,
        dateTaken: dateTaken ?? this.dateTaken,
        description: description ?? this.description,
        published: published ?? this.published,
        author: author ?? this.author,
        authorId: authorId ?? this.authorId,
        tags: tags ?? this.tags,
      );

  /// Crea una instancia de PhotosPublicModel a partir de un mapa JSON.
  factory PhotosPublicModel.fromJson(Map<String, dynamic> json) =>
      PhotosPublicModel(
        title: json["title"],
        link: json["link"],
        media: Media.fromJson(json["media"]),
        dateTaken: DateTime.parse(json["date_taken"]),
        description: json["description"],
        published: DateTime.parse(json["published"]),
        author: json["author"],
        authorId: json["author_id"],
        tags: json["tags"],
      );

  /// Convierte la instancia actual de PhotosPublicModel en un mapa JSON.
  Map<String, dynamic> toJson() => {
        "title": title,
        "link": link,
        "media": media.toJson(),
        "date_taken": dateTaken.toIso8601String(),
        "description": description,
        "published": published.toIso8601String(),
        "author": author,
        "author_id": authorId,
        "tags": tags,
      };
}

/// Modelo para manejar la información de los medios asociados a una foto.
class Media {
  /// URL del medio asociado a la foto.
  final String m;

  /// Constructor principal para inicializar un objeto de tipo [Media].
  Media({
    required this.m,
  });

  /// Crea una copia del objeto actual con la opción de modificar ciertos campos.
  Media copyWith({
    String? m,
  }) =>
      Media(
        m: m ?? this.m,
      );

  /// Crea una instancia de Media a partir de un mapa JSON.
  factory Media.fromJson(Map<String, dynamic> json) => Media(
        m: json["m"],
      );

  /// Convierte la instancia actual de Media en un mapa JSON.
  Map<String, dynamic> toJson() => {
        "m": m,
      };
}
