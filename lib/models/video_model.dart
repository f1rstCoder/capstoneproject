class VideoModel {
  int? id;
  String? title;
  String? description;
  String? source;

  VideoModel({this.id, this.title, this.description, this.source});

  VideoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    source = json['source'];
  }
}
