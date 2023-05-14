import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/beers_model.dart';

class BeersService {
  Future<List<BeersModel>> fetchBeers() async {
    String url = "https://api.punkapi.com/v2/beers";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<BeersModel> beersList = beersModelFromJson(response.body);
      return beersList;
    } else {
      throw Exception("Error fetching list...");
    }
  }
}
