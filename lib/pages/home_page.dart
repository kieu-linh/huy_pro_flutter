import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:huy_pro_flutter/models/album_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<AlbumModel?>? listAlbum = [];
  // AlbumModel album = AlbumModel();
  //b1 doi thawng backend link data
  Future<http.Response> fetchAlbum() {
    //b2 goi api
    return http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    (fetchAlbum().then((value) {
      final dataAlbum = jsonDecode(value.body);
      listAlbum =
          dataAlbum.map((e) => AlbumModel.input(e)).toList().cast<AlbumModel>();

      setState(() {});
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        if (listAlbum?.isNotEmpty == true) Text(listAlbum?[2]?.title ?? ''),
      ]),
    );
  }
}
