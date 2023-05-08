import 'package:im_mottu_mobile/src/data/marvel/data_sources/marvel_data_source.dart';
import 'package:im_mottu_mobile/src/data/marvel/models/marvel_model.dart';
import 'package:im_mottu_mobile/src/data/marvel/requests/request_get_marvel_character.dart';

class MarvelLocal implements MarvelDataSource {

  @override
  Future<List<MarvelModel>?>? getListMarvelCharacter(
      RequestGetMarvelCharacter requestGetMarvelCharacter,
      ) {
    // TODO: implement getMarvelCharacter
    throw UnimplementedError();
  }

}