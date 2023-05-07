import 'package:get/get.dart';
import 'package:im_mottu_mobile/src/data/marvel/models/marvel_model.dart';
import 'package:im_mottu_mobile/src/domain/use_cases/marvel/get_marvel_characters_use_case.dart';

class HomeController extends GetxController {
  final GetMarvelCharacterUseCase getMarvelCharacterUseCase;
  final _listMarvelModel = RxList<MarvelModel>();

  HomeController({
    required this.getMarvelCharacterUseCase,
  });

  @override
  Stream<List<MarvelModel>> get characterStream => _listMarvelModel.stream;

  @override
  void onInit() {
    super.onInit();
    getMarvelCharacters();
  }

  Future<void> getMarvelCharacters() async {
    final result = await getMarvelCharacterUseCase.call();

    try {
      _listMarvelModel.value = result ?? <MarvelModel>[];
    } catch (e) {
      print(e);
    }

  }
}
