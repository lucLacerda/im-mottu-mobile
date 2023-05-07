import 'package:im_mottu_mobile/src/data/marvel/models/marvel_model.dart';
import 'package:im_mottu_mobile/src/domain/repositories/marvel_repository.dart';

class GetMarvelCharacterUseCase {
  final MarvelRepository _marvelRepository;

  GetMarvelCharacterUseCase(this._marvelRepository);

  Future<List<MarvelModel>?> call() async {
    try {
      return await _marvelRepository.getMarvelCharacter();
    } catch (e) {
      //Criar uma abstração de Response, se der erro na chamada aplicar aqui
      return null;
      // return await _marvelRepository.getMarvelCharacter();
    }
  }
}