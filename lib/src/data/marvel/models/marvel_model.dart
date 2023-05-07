class MarvelModel {
  int? id;
  String? name;
  String? description;
  String? modified;
  String? imageURI;
  ComicsModel? comics;

  MarvelModel({
    this.id,
    this.name,
    this.description,
    this.modified,
    this.imageURI,
    this.comics,
  });

  factory MarvelModel.fromJson(Map<String, dynamic> json) {
    return MarvelModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        modified: json['modified'],
        imageURI:
            "${json["thumbnail"]["path"]}.${json["thumbnail"]["extension"]}",
        comics: ComicsModel.fromJson(json["comics"]));
  }
}

class ComicsModel {
  List<Items?>? items;

  ComicsModel({this.items});

  ComicsModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items?.add(Items.fromJson(v));
      });
    }
  }
}

class Items {
  String? resourceURI;
  String? name;

  Items({this.resourceURI, this.name});

  Items.fromJson(Map<String, dynamic> json) {
    resourceURI = json['resourceURI'];
    name = json['name'];
  }
}
