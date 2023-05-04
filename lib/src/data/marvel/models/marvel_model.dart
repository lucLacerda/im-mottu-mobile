class MarvelModel {
  int? id;
  String? name;
  String? description;
  String? modified;
  String? resourceURI;

  MarvelModel({
    this.id,
    this.name,
    this.description,
    this.modified,
    this.resourceURI,
  });

  factory MarvelModel.fromJson(Map<String, dynamic> json) {
    return MarvelModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      modified: json['modified'],
      resourceURI: json['resourceURI'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['modified'] = modified;
    data['resourceURI'] = resourceURI;
    return data;
  }
}
