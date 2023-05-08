import 'package:im_mottu_mobile/src/data/marvel/models/marvel_model.dart';
import 'package:im_mottu_mobile/src/data/marvel/requests/request_get_marvel_character.dart';
import 'package:im_mottu_mobile/src/domain/repositories/marvel_repository.dart';

class GetListMarvelCharacterUseCase {
  final MarvelRepository _marvelRepository;

  GetListMarvelCharacterUseCase(this._marvelRepository);

  Future<List<MarvelModel>?> call(
      RequestGetMarvelCharacter requestGetMarvelCharacter) async {
    try {
      return await _marvelRepository
          .getListMarvelCharacter(requestGetMarvelCharacter);
    } catch (e) {
      //Criar uma abstração de Response, se der erro na chamada aplicar aqui
      return null;
      // return await _marvelRepository.getMarvelCharacter();
    }
  }
}
