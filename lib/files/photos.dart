import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Photos extends StatefulWidget {
  const Photos({Key? key}) : super(key: key);

  @override
  _PhotosState createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
  static const platform = MethodChannel('files.shareit.com/photos');

  List photos = [];

  String? error;

  @override
  void initState() {
    super.initState();
    _fetchPhotos();
  }

  Future<void> _fetchPhotos() async {
    List? images;
    try {
      images = await platform.invokeListMethod('fetch_photos');
    } on PlatformException catch (e) {
      error = e.message;
    }
    setState(() {
      if (images != null) {
        photos = [...images];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [Text('Photos: $photos'), Text('Error: $error')],
    );
  }
}
