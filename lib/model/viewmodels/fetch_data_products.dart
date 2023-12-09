import 'dart:convert';
import 'package:flutter_application_4/model/Products.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Repository {
  final String apiUrl =
      "https://beauty-api-2ee77-default-rtdb.firebaseio.com/products.json";

  Future<List<Products>> fetchDataPlaces() async {
    Response response = await http.get(Uri.parse(apiUrl));
    List<Products> dataPlaces;
    if (response.statusCode == 200) {
      // print(response.body);
      Map<String, dynamic> jsonData = json.decode(response.body);
      //print(jsonData);
      dataPlaces = jsonData.values.map((value) {
        return Products.fromJson(value);
      }).toList();

      return dataPlaces;
    } else {
      throw Exception('Failed to load data places');
    }
  }

  List<Products> filterProducts(List<Products> allProducts, String query) {
    query = query.toLowerCase();

    List<Products> filteredList = allProducts.where((product) {
      return product.brand.toLowerCase().contains(query) ||
          product.name.toLowerCase().contains(query) ||
          product.desc.toLowerCase().contains(query);
    }).toList();

    return filteredList;
  }
}


// class Repository {
//   final String apiUrl = "http://makeup-api.herokuapp.com/api/v1/products.json";

//   Future<List<Products>> fecthDataPlaces() async {
//     Response response = await http.get(Uri.parse(apiUrl));
//     List<Products> dataUser;
//     if (response.statusCode == 200) {
//       List<dynamic> listJson = json.decode(response.body)[""];
//       dataUser = listJson.map((e) => Products.fromJson(e)).toList();
//       print(dataUser);
//       return dataUser;
//     } else {
//       throw Exception('Failed to load data profile');
//     }
//   }
// }

// class Repository {
//   final String apiUrl =
//       "https://beauty-api-2ee77-default-rtdb.firebaseio.com/products.json";

//   Future<List<Products>> fetchDataPlaces() async {
//     Response response = await http.get(Uri.parse(apiUrl));
//     List<Products> dataPlaces;
//     if (response.statusCode == 200) {
//       print(response.body);
//       Map<String, dynamic> jsonData = json.decode(response.body);
//       print(jsonData);
//       dataPlaces = jsonData.values.map((value) {
//         return Products.fromJson(value);
//       }).toList();

//       return dataPlaces;
//     } else {
//       throw Exception('Failed to load data places');
//     }
//   }
// }
