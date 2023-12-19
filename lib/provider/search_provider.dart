import 'package:flutter/material.dart';
import 'package:ondc_flutter_app/model/search_response_model.dart';

class SearchProvider extends ChangeNotifier {
  List<SearchResponseModel> searchList = [];

  resetList() {
    searchList = [];
    notifyListeners();
  }

  addToSearchList(SearchResponseModel model) {
    if (model.error == null) {
      searchList = [...searchList, model];
      notifyListeners();
    }
  }
}
