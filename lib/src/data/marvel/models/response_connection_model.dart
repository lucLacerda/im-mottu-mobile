import 'package:im_mottu_mobile/src/data/marvel/models/data_model.dart';

class ResponseConnectionModel {
  int? code;
  String? status;
  String? copyright;
  String? attributionText;
  String? attributionHTML;
  String? etag;
  DataModel? data;

  ResponseConnectionModel({
    this.code,
    this.status,
    this.copyright,
    this.attributionText,
    this.attributionHTML,
    this.etag,
    this.data,
  });

  factory ResponseConnectionModel.fromJson(Map<String, dynamic> json) {
    return ResponseConnectionModel(
      code: json['code'],
      status: json['status'],
      copyright: json['copyright'],
      attributionText: json['attributionText'],
      attributionHTML: json['attributionHTML'],
      etag: json['etag'],
      data: json['data'] != null ? DataModel.fromJson(json['data']) : null,
    );
  }
}
