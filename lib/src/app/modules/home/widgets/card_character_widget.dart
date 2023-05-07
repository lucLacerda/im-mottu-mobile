import 'package:flutter/material.dart';
import 'package:im_mottu_mobile/src/core/im_mottu_colors.dart';
import 'package:im_mottu_mobile/src/data/marvel/models/marvel_model.dart';

class CardCharacterWidget extends StatelessWidget {
  final MarvelModel marvelModel;
  final Function() onTapCardWidget;

  const CardCharacterWidget({
    super.key,
    required this.marvelModel,
    required this.onTapCardWidget,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => onTapCardWidget(),
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: const BoxDecoration(
          color: ImMottuColors.blueColor,
          borderRadius: BorderRadius.all(
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
            Text(
              marvelModel.name ?? '',
              style: const TextStyle(
                color: ImMottuColors.whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
