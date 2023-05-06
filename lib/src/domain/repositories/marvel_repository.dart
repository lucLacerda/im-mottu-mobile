import 'package:im_mottu_mobile/src/data/marvel/models/marvel_model.dart';

abstract class MarvelRepository {

  Future<List<MarvelModel>?>? getMarvelCharacter();

}
