import 'package:dio/dio.dart' as dioPackage;
import 'package:im_mottu_mobile/src/core/im_mottu_services_constants.dart';
import 'package:im_mottu_mobile/src/data/marvel/data_sources/marvel_data_source.dart';
import 'package:im_mottu_mobile/src/data/marvel/models/marvel_model.dart';

import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:im_mottu_mobile/src/data/marvel/models/response_connection_model.dart';
import 'package:im_mottu_mobile/src/data/marvel/requests/request_get_marvel_character.dart';

class MarvelRemote implements MarvelDataSource {

  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  @override
  Future<List<MarvelModel>?>? getListMarvelCharacter(
      RequestGetMarvelCharacter requestGetMarvelCharacter) async {
    try {
      requestGetMarvelCharacter.hash = generateMd5(
          requestGetMarvelCharacter.timeStamp.toIso8601String() +
              ImMottuServicesConstants.apiKeyPrivate +
              requestGetMarvelCharacter.apiKeyPublic);

      requestGetMarvelCharacter.timeStamp.toIso8601String();

      dioPackage.Response? response;
      final dio = dioPackage.Dio();

      response = await dio.get(
        ImMottuServicesConstants.baseUrl +
            ImMottuServicesConstants.pathCharacters,
        queryParameters: requestGetMarvelCharacter.toJson(),
      );

      return ResponseConnectionModel.fromJson(response.data).data?.results;
    } catch (e) {
      print("Falha ao fazer request: $e");
    }
    return null;
  }
}
