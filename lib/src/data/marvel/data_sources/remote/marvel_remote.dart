import 'package:dio/dio.dart' as dioPackage;
import 'package:im_mottu_mobile/src/core/im_mottu_services_constants.dart';
import 'package:im_mottu_mobile/src/data/marvel/data_sources/marvel_data_source.dart';
import 'package:im_mottu_mobile/src/data/marvel/models/marvel_model.dart';

import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:im_mottu_mobile/src/data/marvel/models/response_connection_model.dart';

class MarvelRemote implements MarvelDataSource {
  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  String getUrlBase(String typeUrl) {
    final DateTime timeStamp = DateTime.now();

    final String hash = generateMd5(timeStamp.toIso8601String() +
        ImMottuServicesConstants.apiKeyPrivate +
        ImMottuServicesConstants.apiKeyPublic);

    final String url =
        "${ImMottuServicesConstants.baseUrl}$typeUrl?apikey=${ImMottuServicesConstants.apiKeyPublic}&hash=$hash&ts=${timeStamp.toIso8601String()}";

    return url;
  }

  @override
  Future<List<MarvelModel>?>? getMarvelCharacter() async {
    try {
      final url = getUrlBase(ImMottuServicesConstants.pathCharacters);

      dioPackage.Response? response;
      final dio = dioPackage.Dio();

      response = await dio.get(url);

      return ResponseConnectionModel.fromJson(json.decode(response.data))
          .data
          ?.results;
    } catch (e) {
      throw Exception("Falha ao fazer request: $e");
    }
  }
}
