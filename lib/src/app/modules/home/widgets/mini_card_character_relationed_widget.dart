import 'package:flutter/material.dart';
import 'package:im_mottu_mobile/src/app/modules/home/widgets/modal_content_widget.dart';
import 'package:im_mottu_mobile/src/core/im_mottu_colors.dart';
import 'package:im_mottu_mobile/src/data/marvel/models/marvel_model.dart';

class MiniCardCharacterRelationedWidget extends StatelessWidget {
  final MarvelModel marvelModel;
  final List<MarvelModel> listCharactersRelationed;
  final Color backgroundColorCard;

  const MiniCardCharacterRelationedWidget({
    super.key,
    required this.marvelModel,
    required this.backgroundColorCard,
    required this.listCharactersRelationed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 180,
        height: 10,
        decoration: BoxDecoration(
          color: backgroundColorCard,
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        margin: const EdgeInsetsDirectional.symmetric(
          horizontal: 8,
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
      onTap: () async => showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(32),
          ),
        ),
        builder: (context) => ModalContentWidget(
          marvelModel: marvelModel,
          listCharactersRelationed: listCharactersRelationed,
        ),
      ),
    );
  }
}
