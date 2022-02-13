import 'package:flutter/material.dart';

import '../constant.dart';

class Search extends SearchDelegate {
  final List countriesSearchList;

  Search(this.countriesSearchList);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? countriesSearchList
        : countriesSearchList.where((element) =>
            element['country'].toString().toLowerCase().startsWith(query));

    return ListView.builder(
        itemCount: suggestionList.length,
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
                        suggestionList.elementAt(index)['country'],
                        style: kTitleTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Image.network(
                        suggestionList.elementAt(index)['countryInfo']['flag'],
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
                          suggestionList.elementAt(index)['cases'].toString(),
                      style: kSubTextStyle.copyWith(color: kInfectedColor),
                    ),
                    Text(
                      'ACTIVE : ' + suggestionList.elementAt(index)['active'].toString(),
                      style: kSubTextStyle.copyWith(color: Colors.blue),
                    ),
                    Text(
                      'RECOVERED : ' +
                          suggestionList.elementAt(index)['recovered'].toString(),
                      style: kSubTextStyle.copyWith(color: kRecovercolor),
                    ),
                    Text(
                      'DEATHS : ' + suggestionList.elementAt(index)['deaths'].toString(),
                      style: kSubTextStyle.copyWith(color: kDeathColor),
                    ),
                  ],
                ))
              ],
            ),
          );
        });
  }
}
