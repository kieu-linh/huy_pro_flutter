class AlbumModel {
  int? userId;
  int? id;
  String? title;

  AlbumModel();

  factory AlbumModel.input(Map<String, dynamic> linh) {
    return AlbumModel()
      ..id = linh['id']
      ..userId = linh['userId']
      ..title = linh['title'];
  }
}
