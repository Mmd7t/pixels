class TrackModel {
  String logo;
  String description;
  String name;
  String video1;
  String video2;
  String video3;
  String video4;
  String video5;
  String course1;
  String course2;
  String course3;
  String book1;
  String book2;
  String book3;

  TrackModel({
    this.name,
    this.description,
    this.logo,
    this.video1,
    this.video2,
    this.video3,
    this.video4,
    this.video5,
    this.course1,
    this.course2,
    this.course3,
    this.book1,
    this.book2,
    this.book3,
  });

  factory TrackModel.fromJson(dynamic json) {
    return TrackModel(
      name: "${json['name']}",
      description: "${json['description']}",
      logo: "${json['logo']}",
      video1: "${json['video1']}",
      video2: "${json['video2']}",
      video3: "${json['video3']}",
      video4: "${json['video4']}",
      video5: "${json['video5']}",
      course1: "${json['course1']}",
      course2: "${json['course2']}",
      course3: "${json['course3']}",
      book1: "${json['book1']}",
      book2: "${json['book2']}",
      book3: "${json['book3']}",
    );
  }

  Map toJson() => {
        "name": name,
        "description": description,
        "logo": logo,
        "video1": video1,
        "video2": video2,
        "video3": video3,
        "video4": video4,
        "video5": video5,
        "course1": course1,
        "course2": course2,
        "course3": course3,
        "book1": book1,
        "book2": book2,
        "book3": book3,
      };
}
