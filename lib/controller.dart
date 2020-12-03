import 'dart:convert' as convert;
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider_example/model/Product.dart';

class Controller with ChangeNotifier {
  bool _loading = true;

  bool get loading => _loading;
  String _user_name = '';

  String get user_name => _user_name;

  List<Product> _products = new List();

  List<Product> get products => _products;

  Controller() {
    getProductList();
  }

  setUserName(String name) {
    _user_name = name;
    notifyListeners();
  }

  getProductList() async {
    try {
      var url = 'https://gorest.co.in/public-api/products';

      // Await the http get response, then decode the json-formatted response.
      var response = await http.get(url);
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        jsonResponse['data'].forEach((v) {
          _products.add(Product.fromJson(v));
        });
        _loading = false;
        notifyListeners();
      } else {
        print('Request failed with status:');
      }
    } catch (e) {}
  }
}
