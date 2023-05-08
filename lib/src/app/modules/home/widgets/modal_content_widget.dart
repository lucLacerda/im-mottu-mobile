import 'package:flutter/material.dart';
import 'package:im_mottu_mobile/src/app/modules/home/widgets/mini_card_character_relationed_widget.dart';
import 'package:im_mottu_mobile/src/core/im_mottu_colors.dart';
import 'package:im_mottu_mobile/src/data/marvel/models/marvel_model.dart';

class ModalContentWidget extends StatelessWidget {
  final MarvelModel marvelModel;
  final List<MarvelModel> listCharactersRelationed;

  const ModalContentWidget({
    super.key,
    required this.marvelModel,
    required this.listCharactersRelationed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsetsDirectional.only(top: 16),
                  child: Text(
                    marvelModel.name ?? 'Hero',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Column(
                  children: [
                    Container(
                      height: 220,
                      width: 220,
                      padding: const EdgeInsetsDirectional.all(16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          marvelModel.imageURI ?? '',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      height: 200,
                      width: double.infinity,
                      margin: const EdgeInsetsDirectional.only(top: 16),
                      child: Text(
                        marvelModel.description != "" &&
                                marvelModel.description != null
                            ? marvelModel.description!
                            : "Not description",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: ImMottuColors.blackColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "Relationed Characters",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listCharactersRelationed.length,
              itemBuilder: (BuildContext context, int index) {
                final Set<MarvelModel> filteredCharacters = {};

                marvelModel.comics?.items?.forEach((element) {
                  final marvels = filterByComics(
                    marvels: listCharactersRelationed,
                    comicsName: element?.name ?? '',
                  );
                  filteredCharacters.addAll(marvels);
                });

                final uniqueCharacter = filteredCharacters.toList();
                if (index >= uniqueCharacter.length || index >= 5) {
                  return null;
                }

                final marvelModelRelationed = uniqueCharacter[index];
                return MiniCardCharacterRelationedWidget(
                  backgroundColorCard: ImMottuColors.redColor,
                  listCharactersRelationed: listCharactersRelationed,
                  marvelModel: marvelModelRelationed,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<MarvelModel> filterByComics({
    required List<MarvelModel> marvels,
    required String comicsName,
  }) {
    return marvels
        .where((marvel) =>
            marvel.comics?.items?.any((item) => item?.name == comicsName) ??
            false)
        .toSet()
        .toList();
  }
}
