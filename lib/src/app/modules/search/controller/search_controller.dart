import 'package:get/get.dart';
import 'package:im_mottu_mobile/src/app/modules/home/store/home_store.dart';

class SearchController extends GetxController {
  RxString searchQuery = ''.obs;

  final HomeStore homeStore;

  SearchController({
    required this.homeStore,
  });

  void setSearchQuery(String query) {
    searchQuery.value = query;
  }

  void clearSearchQuery() {
    searchQuery.value = '';
  }

  bool filterFunction(String name) {
    if (searchQuery.value.isEmpty) {
      return true;
    }
    final query = searchQuery.value.toLowerCase();
    final nameLowerCase = name.toLowerCase();
    return nameLowerCase.contains(query);
  }
}
