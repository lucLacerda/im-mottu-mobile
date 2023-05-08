import 'package:im_mottu_mobile/src/data/marvel/models/marvel_model.dart';
import 'package:im_mottu_mobile/src/data/marvel/requests/request_get_marvel_character.dart';

abstract class MarvelDataSource {
  Future<List<MarvelModel>?>? getListMarvelCharacter(
    RequestGetMarvelCharacter requestGetMarvelCharacter,
  );
}