import 'package:im_mottu_mobile/src/data/marvel/data_sources/marvel_data_source.dart';
import 'package:im_mottu_mobile/src/data/marvel/models/marvel_model.dart';
import 'package:im_mottu_mobile/src/data/marvel/repositories/marvel_repository_abs.dart';

class MarvelRepository implements MarvelRepositoryAbs {
  MarvelDataSource remote;

  MarvelRepository(this.remote);

  @override
  Future<List<MarvelModel>?>? getMarvelCharacter() {
    return remote.getMarvelCharacter();
  }
}
