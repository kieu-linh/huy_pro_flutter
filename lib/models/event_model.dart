import 'package:huy_pro_flutter/models/hit_model.dart';
import 'package:huy_pro_flutter/models/video_model.dart';

class EventModel {
  int? total;
  int? totalHits;
  List<HitModel>? hits;

  EventModel();

  factory EventModel.input(Map<String, dynamic> listEvent) {
    return EventModel()
      ..total = listEvent['total'] as int?
      ..totalHits = listEvent['totalHits'] as int?
      ..hits = (listEvent['hits'] as List<dynamic>?)
          ?.map((e) => HitModel.input(e as Map<String, dynamic>))
          .toList();
  }
}
