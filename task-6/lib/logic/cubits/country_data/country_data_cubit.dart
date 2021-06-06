import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_task_6/data/models/country.dart';
import 'package:flutter_task_6/data/repositories/country_repository.dart';

part 'country_data_state.dart';

class CountryDataCubit extends Cubit<CountryDataState> {
  CountryDataCubit() : super(CountryDataInitial());

  final countryRepo = CountryRepository();

  Future<void> getCountryData() async {
    try {
      var list = await countryRepo.fetchCountries();
      emit(CountryDataLoaded(countryList: list));
    } catch (e) {
      emit(CountryDataError(message: e.toString()));
    }
  }
}