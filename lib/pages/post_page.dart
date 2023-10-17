import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:huy_pro_flutter/models/post_model.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<PostModel> list = [];
  Future<http.Response> fetchPost() async {
    return await http.get(Uri.parse('https://dummyjson.com/products'));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPost().then((value) {
      final data = jsonDecode(value.body);
      list = data.map((e) => PostModel.input(e)).toList().cast<PostModel>();
      setState(() {});
      print(value.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(
            itemBuilder: (context, index) {
              return Text(list[index].name ?? '');
            },
            separatorBuilder: (context, index) => const SizedBox(height: 10.0),
            itemCount: list.length));
  }
}
