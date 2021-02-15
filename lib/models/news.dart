class NewsModel {
  String description;
  List imgs;

  NewsModel({this.description, this.imgs});

  factory NewsModel.fromJson(dynamic json) {
    return NewsModel(
      description: "${json['description']}",
      imgs: json['imgs'],
    );
  }

  Map toJson() => {
        "description": description,
        "imgs": imgs,
      };
}
