import 'package:im_mottu_mobile/src/data/marvel/data_sources/marvel_data_source.dart';
import 'package:im_mottu_mobile/src/data/marvel/models/marvel_model.dart';

class MarvelLocal implements MarvelDataSource {

  @override
  Future<List<MarvelModel>> getMarvelCharacter() {
    // TODO: implement getMarvelCharacter
    throw UnimplementedError();
  }

}