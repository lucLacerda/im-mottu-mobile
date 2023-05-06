import 'package:flutter/material.dart';
import 'package:im_mottu_mobile/src/app/modules/home/controller/home_controller.dart';
import 'package:im_mottu_mobile/src/app/modules/home/widgets/card_character_widget.dart';
import 'package:im_mottu_mobile/src/core/im_mottu_colors.dart';
import 'package:im_mottu_mobile/src/data/marvel/models/marvel_model.dart';

class HomePage extends StatefulWidget {
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
                    shrinkWrap: true,
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (BuildContext context, int indice) {
                      final MarvelModel marvelModel = snapshot.data![indice];
                      return CardCharacterWidget(
                        marvelModel: marvelModel,
                        onTapCardWidget: () async => showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(32),
                            ),
                          ),
                          builder: (context) => modalContent(marvelModel),
                        ),
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

  Widget modalContent(MarvelModel marvelModel) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
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
