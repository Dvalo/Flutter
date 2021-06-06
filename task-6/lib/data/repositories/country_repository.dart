import 'package:dio/dio.dart';
import 'package:flutter_task_6/data/models/country.dart';

class CountryRepository {
  List<Country> countryList = [];
  Dio dio = Dio();

  Future<List<Country>> fetchCountries() async {
    final response = await dio.get('https://restcountries.eu/rest/v2/all');

    if (response.statusCode == 200) {
      var loadedCountries = <Country>[];
      response.data.forEach((country) {
        var countryModel = Country.fromJson(country);
        loadedCountries.add(countryModel);
        countryList = loadedCountries;
        return countryList;
      });
    }
    return countryList;
  }
}