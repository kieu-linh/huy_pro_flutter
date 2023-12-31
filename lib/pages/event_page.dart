import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:huy_pro_flutter/pages/video_page.dart';
import 'package:video_player/video_player.dart';

import 'package:http/http.dart' as http;
import 'package:huy_pro_flutter/models/event_model.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  late VideoPlayerController videoPlayerController;
  late EventModel event = EventModel();
  Future<http.Response> fetchEvent() async {
    return await http.get(
      Uri.parse(
          'https://pixabay.com/api/videos/?key=23361083-8bb4d7be8c9cfe6723a356cda&q=candy&pretty=true'),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // videoPlayerController = VideoPlayerController.networkUrl(Uri.parse())
    fetchEvent().then((value) {
      final data = jsonDecode(value.body);
      event = EventModel.input(data);
      print(event.total);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (context, index) {
            return VideoPage(linkVideo: event.hits?[index].videos?.tiny?.url);
            // return Placeholder();
          },
          separatorBuilder: (_, __) {
            return SizedBox(height: 10.0);
          },
          itemCount: event.hits?.length ?? 0),
    );
  }
}
