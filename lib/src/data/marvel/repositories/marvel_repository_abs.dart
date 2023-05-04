import 'package:im_mottu_mobile/src/data/marvel/models/marvel_model.dart';

abstract class MarvelRepositoryAbs {

  Future<List<MarvelModel>?>? getMarvelCharacter();

}
