import 'dart:convert';

import 'package:covid19/screens/search_screen.dart';
import 'package:flutter/material.dart';

import '../constant.dart';
import '../network/api_service.dart';

class CountryStats extends StatefulWidget {
  const CountryStats({Key? key}) : super(key: key);

  @override
  _CountryStatsState createState() => _CountryStatsState();
}

class _CountryStatsState extends State<CountryStats> {
  late List countriesData;

  fetchCountriesData() async {
    final casesJson = await TrackerService()
        .getData('https://disease.sh/v3/covid-19/countries?sort=deaths');
    setState(() {
      countriesData = json.decode(casesJson);
    });
  }

  @override
  void initState() {
    fetchCountriesData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Country Stats'),
        actions: [
          IconButton(onPressed: () {
            showSearch(context: context, delegate: Search(countriesData));
          }, icon: const Icon(Icons.search)),
        ],
      ),
      body: ListView.builder(
          itemCount: countriesData.length,
          itemBuilder: (context, index) {
            return Container(
              height: 130,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 10),
                  blurRadius: 10,
                  color: kShadowColor,
                ),
              ]),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          countriesData[index]['country'],
                          style: kTitleTextStyle.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Image.network(
                          countriesData[index]['countryInfo']['flag'],
                          height: 60,
                          width: 80,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'CONFIRMED : ' +
                            countriesData[index]['cases'].toString(),
                        style: kSubTextStyle.copyWith(color: kInfectedColor),
                      ),
                      Text(
                        'ACTIVE : ' + countriesData[index]['active'].toString(),
                        style: kSubTextStyle.copyWith(color: Colors.blue),
                      ),
                      Text(
                        'RECOVERED : ' +
                            countriesData[index]['recovered'].toString(),
                        style: kSubTextStyle.copyWith(color: kRecovercolor),
                      ),
                      Text(
                        'DEATHS : ' + countriesData[index]['deaths'].toString(),
                        style: kSubTextStyle.copyWith(color: kDeathColor),
                      ),
                    ],
                  ))
                ],
              ),
            );
          }),
    );
  }
}
