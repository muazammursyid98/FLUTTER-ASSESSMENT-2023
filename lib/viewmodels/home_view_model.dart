import 'package:flutter/cupertino.dart';

import '../locator.dart';
import '../models/beers_model.dart';
import '../services/authentication_service.dart';
import '../services/beers_service.dart';
import 'base_model.dart';

class HomeViewModel extends ChangeNotifier {
  final BeersService _beersService = locator<BeersService>();
  late List<BeersModel> _beersList = [];
  List<BeersModel> get beersList => _beersList;
  BaseModel baseModel = BaseModel();

  Future<void> fetchBeers() async {
    baseModel.setBusy(true);
    _beersList = await _beersService.fetchBeers();
    notifyListeners();
    baseModel.setBusy(false);
  }

  void highlightedColor() async {
    notifyListeners();
  }
}
