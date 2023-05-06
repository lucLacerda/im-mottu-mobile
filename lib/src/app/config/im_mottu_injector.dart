import 'package:flutter_modular/flutter_modular.dart';
import 'package:im_mottu_mobile/src/app/modules/home/controller/home_controller.dart';
import 'package:im_mottu_mobile/src/app/modules/home/page/home_page.dart';
import 'package:im_mottu_mobile/src/data/marvel/data_sources/marvel_data_source.dart';
import 'package:im_mottu_mobile/src/data/marvel/data_sources/remote/marvel_remote.dart';
import 'package:im_mottu_mobile/src/domain/repositories/marvel_repository.dart';
import 'package:im_mottu_mobile/src/data/marvel/repositories/marvel_repository_impl.dart';
import 'package:im_mottu_mobile/src/domain/use_cases/marvel/get_marvel_characters_use_case.dart';

class ImMottuInjector extends Module {
  @override
  List<Bind<Object>> get binds => [
        // Repository
        Bind.lazySingleton<MarvelRepository>(
            (i) => MarvelRepositoryImpl(remote: i<MarvelRemote>())),

        // DataSource
        Bind.lazySingleton<MarvelDataSource>((i) => MarvelRemote()),

        // UseCase
        Bind.lazySingleton<GetMarvelCharacterUseCase>(
            (i) => GetMarvelCharacterUseCase(i())),

        // Controller
        Bind.lazySingleton<HomeController>((i) => HomeController(
              getMarvelCharacterUseCase: i(),
            )),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) =>
                HomePage(homeController: Modular.get<HomeController>())),
      ];
}
