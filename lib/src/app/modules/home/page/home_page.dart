import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:im_mottu_mobile/src/app/modules/home/controller/home_controller.dart';
import 'package:im_mottu_mobile/src/app/modules/home/widgets/card_character_widget.dart';
import 'package:im_mottu_mobile/src/app/modules/search/page/search_page.dart';
import 'package:im_mottu_mobile/src/core/im_mottu_colors.dart';
import 'package:im_mottu_mobile/src/data/marvel/models/marvel_model.dart';

class HomePage extends StatefulWidget {
  static const String route = '/home';

  final HomeController homeController;

  const HomePage({
    Key? key,
    required this.homeController,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    widget.homeController.getMarvelCharacters();
    widget.homeController.initScroll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Marvel Heroes"),
        centerTitle: true,
        backgroundColor: ImMottuColors.blueColor,
      ),
      body: Center(
        child: Builder(
          builder: (BuildContext buildContext) {
            return StreamBuilder<List<MarvelModel>>(
              stream: widget.homeController.characterStream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text("Algo deu errado");
                }
                if (snapshot.hasData) {
                  return ListView.builder(
                    controller:
                        widget.homeController.homeStore.scrollController,
                    shrinkWrap: true,
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (BuildContext context, int indice) {
                      final MarvelModel marvelModel = snapshot.data![indice];
                      return Column(
                        children: [
                          CardCharacterWidget(
                            marvelModel: marvelModel,
                            backgroundColorCard: ImMottuColors.blueColor,
                          ),
                        ],
                      );
                    },
                  );
                }
                return const CircularProgressIndicator();
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: ImMottuColors.orangeColor,
        child: const Icon(Icons.search),
      ),
    );
  }
}
