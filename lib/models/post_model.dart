class PostModel {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  PostModel();

  factory PostModel.input(Map<String, dynamic> listPost) {
    return PostModel()
      ..postId = listPost['postId']
      ..id = listPost['id']
      ..name = listPost['name']
      ..email = listPost['email']
      ..body = listPost['body'];
  }
}
