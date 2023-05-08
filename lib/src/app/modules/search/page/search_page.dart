import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_mottu_mobile/src/app/modules/home/widgets/card_character_widget.dart';
import 'package:im_mottu_mobile/src/app/modules/search/controller/search_controller.dart';
import 'package:im_mottu_mobile/src/core/im_mottu_colors.dart';
import 'package:im_mottu_mobile/src/data/marvel/models/marvel_model.dart';

class SearchPage extends StatelessWidget {
  static const String route = "/searchPage";
  final SearchController searchController;

  const SearchPage({
    super.key,
    required this.searchController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ImMottuColors.orangeColor,
        title: TextField(
          decoration: const InputDecoration(
            hintText: 'Search by name',
            hintStyle: TextStyle(color: ImMottuColors.whiteColor),
          ),
          style: const TextStyle(color: ImMottuColors.whiteColor),
          onChanged: searchController.setSearchQuery,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: searchController.clearSearchQuery,
          ),
        ],
      ),
      body: Obx(
        () {
          final filteredList = searchController.homeStore.listMarvelModel
              .where((marvelModel) =>
                  searchController.filterFunction(marvelModel.name ?? ''))
              .toList();

          return ListView.builder(
            shrinkWrap: true,
            itemCount: filteredList.length,
            itemBuilder: (BuildContext context, int indice) {
              final MarvelModel marvelModel = filteredList[indice];
              return CardCharacterWidget(
                marvelModel: marvelModel,
                backgroundColorCard: ImMottuColors.orangeColor,
                listCharactersRelationed: filteredList,
              );
            },
          );
        },
      ),
    );
  }
}
