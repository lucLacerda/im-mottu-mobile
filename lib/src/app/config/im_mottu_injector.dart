import 'package:flutter_modular/flutter_modular.dart';
import 'package:im_mottu_mobile/src/app/modules/home/controller/home_controller.dart';
import 'package:im_mottu_mobile/src/app/modules/home/page/home_page.dart';
import 'package:im_mottu_mobile/src/app/modules/home/store/home_store.dart';
// import 'package:im_mottu_mobile/src/app/modules/search/controller/search_controller.dart';
// import 'package:im_mottu_mobile/src/app/modules/search/page/search_page.dart';
// import 'package:im_mottu_mobile/src/app/modules/splash/page/splash_page.dart';
import 'package:im_mottu_mobile/src/data/marvel/data_sources/marvel_data_source.dart';
import 'package:im_mottu_mobile/src/data/marvel/data_sources/remote/marvel_remote.dart';
import 'package:im_mottu_mobile/src/domain/repositories/marvel_repository.dart';
import 'package:im_mottu_mobile/src/data/marvel/repositories/marvel_repository_impl.dart';
import 'package:im_mottu_mobile/src/domain/use_cases/marvel/get_list_marvel_characters_use_case.dart';

class ImMottuInjector extends Module {
  @override
  List<Bind<Object>> get binds => [
       // DataSource
       Bind.lazySingleton<MarvelDataSource>((i) => MarvelRemote()),

        // Repository
        Bind.lazySingleton<MarvelRepository>(
            (i) => MarvelRepositoryImpl(remote: i<MarvelRemote>())),

        // UseCase
        Bind.lazySingleton<GetListMarvelCharacterUseCase>(
            (i) => GetListMarvelCharacterUseCase(i())),

        //Store
        Bind.lazySingleton<HomeStore>((i) => HomeStore()),

        // Controller
        Bind.lazySingleton<HomeController>((i) => HomeController(
              getListMarvelCharacterUseCase: i(),
              homeStore: i(),
            )),
        // Bind.lazySingleton<SearchController>((i) => SearchController(
        //       homeStore: i(),
        //     )),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) =>
                HomePage(homeController: Modular.get<HomeController>())),
      ];
}
