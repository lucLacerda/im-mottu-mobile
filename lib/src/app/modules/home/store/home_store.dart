import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_mottu_mobile/src/data/marvel/models/marvel_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeStore {
  final listMarvelModel = RxList<MarvelModel>();
  final scrollController = ScrollController();

  late SharedPreferences sharedPreferences;

  HomeStore() {
    _init();
  }

  Future<void> _init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
}