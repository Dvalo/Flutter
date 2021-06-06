import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task_6/data/models/country.dart';

class DetailsScreen extends StatelessWidget {

  final Country country;
  DetailsScreen({Key key, @required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(country.countryName),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin:EdgeInsets.all(25.0),
          child: Center(
            child: Column(
              children: [
                Container(
                  child: SvgPicture.network(country.flag),
                  height: 250.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "Name",
                          textAlign: TextAlign.left
                      ),
                      Text(
                          country.countryName,
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.left
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "Code",
                          textAlign: TextAlign.left
                      ),
                      Text(
                          country.countryCode,
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.left
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "Capital",
                          textAlign: TextAlign.left
                      ),
                      Text(
                          country.capitalCity,
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.left
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "Region",
                          textAlign: TextAlign.left
                      ),
                      Text(
                          country.region,
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.left
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "Population",
                          textAlign: TextAlign.left
                      ),
                      Text(
                          country.population.toString(),
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.left
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "Currency",
                          textAlign: TextAlign.left
                      ),
                      Text(
                          country.currency,
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.left
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}