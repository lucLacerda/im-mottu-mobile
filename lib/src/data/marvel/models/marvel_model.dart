class MarvelModel {
  int? id;
  String? name;
  String? description;
  String? modified;
  String? imageURI;

  MarvelModel({
    this.id,
    this.name,
    this.description,
    this.modified,
    this.imageURI,
  });

  factory MarvelModel.fromJson(Map<String, dynamic> json) {
    return MarvelModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      modified: json['modified'],
      imageURI:
          "${json["thumbnail"]["path"]}.${json["thumbnail"]["extension"]}",
    );
  }
}
