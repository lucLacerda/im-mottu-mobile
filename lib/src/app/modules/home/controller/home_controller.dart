import 'dart:convert';

import 'package:get/get.dart';
import 'package:im_mottu_mobile/src/app/modules/home/store/home_store.dart';
import 'package:im_mottu_mobile/src/core/im_mottu_services_constants.dart';
import 'package:im_mottu_mobile/src/data/marvel/models/marvel_model.dart';
import 'package:im_mottu_mobile/src/data/marvel/requests/request_get_marvel_character.dart';
import 'package:im_mottu_mobile/src/domain/use_cases/marvel/get_list_marvel_characters_use_case.dart';

class HomeController extends GetxController {
  final GetListMarvelCharacterUseCase getListMarvelCharacterUseCase;
  final HomeStore homeStore;

  HomeController({
    required this.getListMarvelCharacterUseCase,
    required this.homeStore,
  });

  Stream<List<MarvelModel>> get characterStream =>
      homeStore.listMarvelModel.stream;

  @override
  void onInit() {
    super.onInit();
    initScroll();
    getMarvelCharacters();
  }

  void initScroll() {
    homeStore.scrollController.addListener(() {
      if (homeStore.scrollController.position.pixels ==
          homeStore.scrollController.position.maxScrollExtent) {
        getMarvelCharacters(
          offset: homeStore.listMarvelModel.value.length,
          limit: ImMottuServicesConstants.limitOffset,
          appendData: true,
        );
      }
    });
  }

  Future<void> getMarvelCharacters({
    int? limit,
    int? offset,
    bool appendData = false,
  }) async {
    final request = RequestGetMarvelCharacter(
      apiKeyPublic: ImMottuServicesConstants.apiKeyPublic,
      timeStamp: DateTime.now(),
      limit: limit,
      offset: offset,
    );

    try {
      final result = await getListMarvelCharacterUseCase.call(request);

      final data = result ?? <MarvelModel>[];
      final newData =
          appendData ? homeStore.listMarvelModel.value + data : data;
      homeStore.listMarvelModel.value = newData;

      await homeStore.sharedPreferences.setString(
          ImMottuServicesConstants.marvelListCharacters, jsonEncode(newData));
    } catch (e) {
      print(e);
    }
  }
}
