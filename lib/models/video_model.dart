import 'package:huy_pro_flutter/models/video_base_model.dart';

class VideoModel {
  VideoBaseModel? large;
  VideoBaseModel? medium;
  VideoBaseModel? small;
  VideoBaseModel? tiny;

  VideoModel();
  factory VideoModel.input(Map<String, dynamic> listVideo) {
    return VideoModel()
      ..large = listVideo['large'] == null
          ? null
          : VideoBaseModel.input(listVideo['large'] as Map<String, dynamic>)
      ..medium = listVideo['medium'] == null
          ? null
          : VideoBaseModel.input(listVideo['medium'] as Map<String, dynamic>)
      ..small = listVideo['small'] == null
          ? null
          : VideoBaseModel.input(listVideo['small'] as Map<String, dynamic>)
      ..tiny = listVideo['tiny'] == null
          ? null
          : VideoBaseModel.input(listVideo['tiny'] as Map<String, dynamic>);
  }
}
