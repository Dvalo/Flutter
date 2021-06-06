part of 'country_data_cubit.dart';

abstract class CountryDataState extends Equatable {
  const CountryDataState();
}

class CountryDataInitial extends CountryDataState {
  @override
  List<Object> get props => [];
}

class CountryDataLoaded extends CountryDataState {
  final List<Country> countryList;

  CountryDataLoaded({this.countryList});

  @override
  List<Object> get props => [countryList];
}

class CountryDataError extends CountryDataState {
  final String message;

  CountryDataError({this.message});

  @override
  List<Object> get props => [message];
}