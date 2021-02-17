class FacebookPosts {
  String id;
  String name;
  String about;
  Feed feed;

  FacebookPosts({this.id, this.name, this.about, this.feed});

  FacebookPosts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    about = json['about'];
    feed = json['feed'] != null ? new Feed.fromJson(json['feed']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['about'] = this.about;
    if (this.feed != null) {
      data['feed'] = this.feed.toJson();
    }
    return data;
  }
}

class Feed {
  List<Data> data;
  Paging paging;

  Feed({this.data, this.paging});

  Feed.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    paging =
        json['paging'] != null ? new Paging.fromJson(json['paging']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    if (this.paging != null) {
      data['paging'] = this.paging.toJson();
    }
    return data;
  }
}

class Data {
  String createdTime;
  String fullPicture;
  Attachments attachments;
  String message;
  List<MessageTags> messageTags;
  String id;
  FeedTargeting feedTargeting;

  Data(
      {this.createdTime,
      this.fullPicture,
      this.attachments,
      this.message,
      this.messageTags,
      this.id,
      this.feedTargeting});

  Data.fromJson(Map<String, dynamic> json) {
    createdTime = json['created_time'];
    fullPicture = json['full_picture'];
    attachments = json['attachments'] != null
        ? new Attachments.fromJson(json['attachments'])
        : null;
    message = json['message'];
    if (json['message_tags'] != null) {
      messageTags = new List<MessageTags>();
      json['message_tags'].forEach((v) {
        messageTags.add(new MessageTags.fromJson(v));
      });
    }
    id = json['id'];
    feedTargeting = json['feed_targeting'] != null
        ? new FeedTargeting.fromJson(json['feed_targeting'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_time'] = this.createdTime;
    data['full_picture'] = this.fullPicture;
    if (this.attachments != null) {
      data['attachments'] = this.attachments.toJson();
    }
    data['message'] = this.message;
    if (this.messageTags != null) {
      data['message_tags'] = this.messageTags.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    if (this.feedTargeting != null) {
      data['feed_targeting'] = this.feedTargeting.toJson();
    }
    return data;
  }
}

class Attachments {
  List<Data> data;

  Attachments({this.data});

  Attachments.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AttachmentsData {
  String url;
  Attachments subattachments;
  String mediaType;
  String type;
  String description;

  AttachmentsData(
      {this.url,
      this.subattachments,
      this.mediaType,
      this.type,
      this.description});

  AttachmentsData.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    subattachments = json['subattachments'] != null
        ? new Attachments.fromJson(json['subattachments'])
        : null;
    mediaType = json['media_type'];
    type = json['type'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    if (this.subattachments != null) {
      data['subattachments'] = this.subattachments.toJson();
    }
    data['media_type'] = this.mediaType;
    data['type'] = this.type;
    data['description'] = this.description;
    return data;
  }
}

class SubAttachmentsData {
  Media media;
  Target target;
  String type;
  String url;
  String description;
  String title;

  SubAttachmentsData(
      {this.media,
      this.target,
      this.type,
      this.url,
      this.description,
      this.title});

  SubAttachmentsData.fromJson(Map<String, dynamic> json) {
    media = json['media'] != null ? new Media.fromJson(json['media']) : null;
    target =
        json['target'] != null ? new Target.fromJson(json['target']) : null;
    type = json['type'];
    url = json['url'];
    description = json['description'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.media != null) {
      data['media'] = this.media.toJson();
    }
    if (this.target != null) {
      data['target'] = this.target.toJson();
    }
    data['type'] = this.type;
    data['url'] = this.url;
    data['description'] = this.description;
    data['title'] = this.title;
    return data;
  }
}

class Media {
  ImageData image;

  Media({this.image});

  Media.fromJson(Map<String, dynamic> json) {
    image =
        json['image'] != null ? new ImageData.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    return data;
  }
}

class ImageData {
  int height;
  String src;
  int width;

  ImageData({this.height, this.src, this.width});

  ImageData.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    src = json['src'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['src'] = this.src;
    data['width'] = this.width;
    return data;
  }
}

class Target {
  String id;
  String url;

  Target({this.id, this.url});

  Target.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    return data;
  }
}

class MessageTags {
  String id;
  String name;
  int offset;
  int length;
  String type;

  MessageTags({this.id, this.name, this.offset, this.length, this.type});

  MessageTags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    offset = json['offset'];
    length = json['length'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['offset'] = this.offset;
    data['length'] = this.length;
    data['type'] = this.type;
    return data;
  }
}

class FeedTargeting {
  int ageMin;
  int ageMax;
  List<String> interests;
  GeoLocations geoLocations;

  FeedTargeting({this.ageMin, this.ageMax, this.interests, this.geoLocations});

  FeedTargeting.fromJson(Map<String, dynamic> json) {
    ageMin = json['age_min'];
    ageMax = json['age_max'];
    interests = json['interests'].cast<String>();
    geoLocations = json['geo_locations'] != null
        ? new GeoLocations.fromJson(json['geo_locations'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age_min'] = this.ageMin;
    data['age_max'] = this.ageMax;
    data['interests'] = this.interests;
    if (this.geoLocations != null) {
      data['geo_locations'] = this.geoLocations.toJson();
    }
    return data;
  }
}

class GeoLocations {
  List<Cities> cities;

  GeoLocations({this.cities});

  GeoLocations.fromJson(Map<String, dynamic> json) {
    if (json['cities'] != null) {
      cities = new List<Cities>();
      json['cities'].forEach((v) {
        cities.add(new Cities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cities != null) {
      data['cities'] = this.cities.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cities {
  String key;

  Cities({this.key});

  Cities.fromJson(Map<String, dynamic> json) {
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    return data;
  }
}

class Paging {
  Cursors cursors;
  String next;

  Paging({this.cursors, this.next});

  Paging.fromJson(Map<String, dynamic> json) {
    cursors =
        json['cursors'] != null ? new Cursors.fromJson(json['cursors']) : null;
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cursors != null) {
      data['cursors'] = this.cursors.toJson();
    }
    data['next'] = this.next;
    return data;
  }
}

class Cursors {
  String before;
  String after;

  Cursors({this.before, this.after});

  Cursors.fromJson(Map<String, dynamic> json) {
    before = json['before'];
    after = json['after'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['before'] = this.before;
    data['after'] = this.after;
    return data;
  }
}
