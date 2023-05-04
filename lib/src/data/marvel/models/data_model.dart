import 'package:im_mottu_mobile/src/data/marvel/models/marvel_model.dart';

class DataModel {
  int? offset;
  int? limit;
  int? total;
  int? count;
  List<MarvelModel>? results;

  DataModel({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.results,
  });

  DataModel.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    limit = json['limit'];
    total = json['total'];
    count = json['count'];
    if (json['results'] != null) {
      results = <MarvelModel>[];
      json['results'].forEach((v) {
        results!.add(MarvelModel.fromJson(v));
      });
    }
  }
}
