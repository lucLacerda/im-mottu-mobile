import 'package:im_mottu_mobile/src/data/marvel/data_sources/marvel_data_source.dart';
import 'package:im_mottu_mobile/src/data/marvel/models/marvel_model.dart';
import 'package:im_mottu_mobile/src/data/marvel/repositories/marvel_repository.dart';

class MarvelRepositoryImpl implements MarvelRepository {
  MarvelDataSource remote;

  MarvelRepositoryImpl(this.remote);

  @override
  Future<List<MarvelModel>?>? getMarvelCharacter() {
    // TODO: implement getMarvelCharacter
    throw UnimplementedError();
  }

}