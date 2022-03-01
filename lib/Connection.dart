import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import 'Meals.dart';


class Connection {
  Future<List<Meals>> getData() async {


    // setting Api to ready for connect
    var url = Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/search.php?f=a');

    // Await the http get response

    try {
      var response = await http.get(url);

      // make sure the status code is 200 ( Connection is done and has valid data with no issues )
      if (response.statusCode == 200) {
        // then decode the json-formatted response.
        var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;

        // modulate my data to list of objects of Meals
        List myItems = jsonResponse['meals'] as List;
        List<Meals> list = myItems.map((e) {
          return Meals.fromJson(e);
        }).toList();

        // return my list of Artical and data ready to view
        return list;
      } else {
        /// return
        return [];
        print('Request failed with status: ${response.statusCode}.');
      }
    } on Exception catch (e) {
      return [
        Meals(
            strMeal: 'Error while loading data',
            strMealThumb: 'Error',
            strInstructions: '')
      ];
    }
  }
}
