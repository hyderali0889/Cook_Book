// ignore_for_file: file_names, avoid_print
import 'dart:convert';

import 'package:http/http.dart' as http;

class FetchApi {
  fetchListOfAllCategory() async {
    var client = http.Client();
    try {
      var res = await client.get(
          Uri.parse("https://www.themealdb.com/api/json/v1/1/list.php?c=list"));
      if (res.statusCode == 200) {
        // print(res.body);
        return json.decode(res.body);
      }
    } catch (e) {
      print(e);
    }
  }

  fetchARandomRecipe() async {
    var client = http.Client();
    try {
      var res = await client
          .get(Uri.parse("https://www.themealdb.com/api/json/v1/1/random.php"));
      if (res.statusCode == 200) {
        // print(res.body);
        return json.decode(res.body);
      }
    } catch (e) {
      print(e);
    }
  }

  fetchListOfAllAreas() async {
    var client = http.Client();
    try {
      var res = await client.get(
          Uri.parse("https://www.themealdb.com/api/json/v1/1/list.php?a=list"));
      if (res.statusCode == 200) {
        // print(res.body);
        return json.decode(res.body);
      }
    } catch (e) {
      print(e);
    }
  }

  fetchListOfAllIngredients() async {
    var client = http.Client();
    try {
      var res = await client.get(
          Uri.parse("https://www.themealdb.com/api/json/v1/1/list.php?i=list"));
      if (res.statusCode == 200) {
        // print(res.body);
        return json.decode(res.body);
      }
    } catch (e) {
      print(e);
    }
  }

  fetchDataFromAnIngredients(ingredient) async {
    var client = http.Client();
    try {
      var res = await client.get(Uri.parse(
          "https://www.themealdb.com/api/json/v1/1/filter.php?i=$ingredient"));
      if (res.statusCode == 200) {
        // print(res.body);
        return json.decode(res.body);
      }
    } catch (e) {
      print(e);
    }
  }

  fetchDataForASpecificCountry(country) async {
    var client = http.Client();
    try {
      var res = await client.get(Uri.parse(
          "https://www.themealdb.com/api/json/v1/1/filter.php?a=$country"));
      if (res.statusCode == 200) {
        // print(res.body);
        return json.decode(res.body);
      }
    } catch (e) {
      print(e);
    }
  }

  fetchDataByid(id) async {
    var client = http.Client();
    try {
      var res = await client
          .get(Uri.parse("https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id"));
      if (res.statusCode == 200) {
        // print(res.body);
        return json.decode(res.body);
      }
    } catch (e) {
      print(e);
    }
  }

  fetchDataByFirstLetter(letter) async {
    var client = http.Client();
    try {
      var res = await client.get(
          Uri.parse("https://www.themealdb.com/api/json/v1/1/search.php?f=$letter"));
      if (res.statusCode == 200) {
        // print(res.body);
        return json.decode(res.body);
      }
    } catch (e) {
      print(e);
    }
  }

  fetchDataByName(query) async {
    var client = http.Client();
    try {
      var res = await client.get(
          Uri.parse("https://www.themealdb.com/api/json/v1/1/search.php?s=$query"));
      if (res.statusCode == 200) {
        // print(res.body);
        return json.decode(res.body);
      }
    } catch (e) {
      print(e);
    }
  }

  fetchDataByCategory(category) async {
    var client = http.Client();
    try {
      var res = await client.get(
          Uri.parse("https://www.themealdb.com/api/json/v1/1/filter.php?c=$category"));
      if (res.statusCode == 200) {
        // print(res.body);
        return json.decode(res.body);
      }
    } catch (e) {
      print(e);
    }
  }
}
