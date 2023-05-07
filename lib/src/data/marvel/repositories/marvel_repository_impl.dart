import 'package:im_mottu_mobile/src/data/marvel/data_sources/marvel_data_source.dart';
import 'package:im_mottu_mobile/src/data/marvel/models/marvel_model.dart';
import 'package:im_mottu_mobile/src/data/marvel/requests/request_get_marvel_character.dart';
import 'package:im_mottu_mobile/src/domain/repositories/marvel_repository.dart';

class MarvelRepositoryImpl implements MarvelRepository {
  MarvelDataSource remote;

  MarvelRepositoryImpl({
    required this.remote,
  });

  @override
  Future<List<MarvelModel>?>? getListMarvelCharacter(RequestGetMarvelCharacter requestGetMarvelCharacter) {
    return remote.getListMarvelCharacter(requestGetMarvelCharacter);
  }
}
