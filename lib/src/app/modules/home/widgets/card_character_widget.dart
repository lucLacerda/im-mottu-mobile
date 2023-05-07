import 'package:flutter/material.dart';
import 'package:im_mottu_mobile/src/core/im_mottu_colors.dart';
import 'package:im_mottu_mobile/src/data/marvel/models/marvel_model.dart';

class CardCharacterWidget extends StatelessWidget {
  final MarvelModel marvelModel;
  // final List<MarvelModel> listCharactersRelationed;
  final Color backgroundColorCard;

  const CardCharacterWidget({
    super.key,
    required this.marvelModel,
    required this.backgroundColorCard,
    // required this.listCharactersRelationed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: backgroundColorCard,
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        margin: const EdgeInsetsDirectional.symmetric(
          horizontal: 32,
          vertical: 16,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                marvelModel.imageURI ?? '',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Text(
                marvelModel.name ?? '',
                style: const TextStyle(
                  color: ImMottuColors.whiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () async =>
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(32),
              ),
            ),
            builder: (context) =>
                modalContent(
                  context,
                  marvelModel,
                ),
          ),
    );
  }

  Widget modalContent(BuildContext context, MarvelModel marvelModel) {
    return SizedBox(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.6,
      child: Column(
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
        ],
      ),
    );
  }
}
