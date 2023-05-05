import 'package:flutter_modular/flutter_modular.dart';
import 'package:im_mottu_mobile/src/app/modules/home/page/home_page.dart';
import 'package:im_mottu_mobile/src/data/marvel/data_sources/marvel_data_source.dart';
import 'package:im_mottu_mobile/src/data/marvel/data_sources/remote/marvel_remote.dart';
import 'package:im_mottu_mobile/src/data/marvel/repositories/marvel_repository.dart';
import 'package:im_mottu_mobile/src/domain/repositories/marvel_repository_impl.dart';

class ImMottuInjector extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<MarvelDataSource>((i) => MarvelRemote()),
        Bind.lazySingleton<MarvelRepository>(
            (i) => MarvelRepositoryImpl(i<MarvelRemote>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
        ChildRoute('/:id', child: (context, args) => const HomePage()),
      ];
}
