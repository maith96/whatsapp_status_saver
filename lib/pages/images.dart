import 'package:flutter/cupertino.dart';
import 'dart:io';

import 'package:flutter/material.dart';

import 'dart:async';

 class Images extends StatefulWidget{
   const Images({super.key});
 
   @override
   State<Images> createState() => _ImagesState();
 }

class _ImagesState extends State<Images> {
  late Future<List<File>> _images;

  @override
  @override
  void initState() {
    super.initState();
    _images = getWhatsAppStatusImages();
  }

  Future<List<File>> getWhatsAppStatusImages() async {
    final directory = Directory('/storage/emulated/0/WhatsApp/Media/.Statuses');
    if (await directory.exists()) {
      final List<FileSystemEntity> entities = directory.listSync();
      final List<File> imageFiles = entities
          .where((entity) =>
          entity is File && entity.path.endsWith('.jpg'))
          .map((entity) => File(entity.path))
          .toList();
      return imageFiles;
    } else {
      throw Exception('WhatsApp status directory not found');
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<File>>(
      future: _images,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Image.file(
                snapshot.data![index],
                fit: BoxFit.cover,
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}


