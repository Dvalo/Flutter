import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_task_6/logic/cubits/country_data/country_data_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country List'),
      ),
      body: BlocConsumer<CountryDataCubit, CountryDataState>(
        listener: (context, state) {
          if (state is CountryDataError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is CountryDataInitial) {
            BlocProvider.of<CountryDataCubit>(context).getCountryData();
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CountryDataLoaded) {
            return ListView.builder(
              itemBuilder: (context, index) {
                var country = state.countryList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed('/country-details', arguments: country);
                  },
                  child: Card(
                    color: Color(0xff1c2754),
                    margin:EdgeInsets.all(16.0),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            child: SvgPicture.network(country.flag),
                            height: 230.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  country.countryName,
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    country.region,
                                    textAlign: TextAlign.left
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: state.countryList.length,
            );
          } else {
            return Center(
              child: Text('Ops! Something went wrong!'),
            );
          }
        },
      ),
    );
  }
}