import 'package:covid19/constant.dart';
import 'package:flutter/material.dart';

class MostInfectedCountriesWidget extends StatelessWidget {
  const MostInfectedCountriesWidget({Key? key, required this.countryData})
      : super(key: key);

  final List countryData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Column(
          children: [
            Row(
              children: [
                Image.network(
                  countryData[index]['countryInfo']['flag'],
                  fit: BoxFit.fill,
                  height: 25,
                  width: 40,
                ),
                const SizedBox(width: 10,),
                Text(
                  countryData[index]['country'],
                  style: kSubTextStyle.copyWith(fontWeight: FontWeight.bold,color: kPrimaryColor)
                ),
                const SizedBox(width: 10,),
                Text(
                  'Deaths: ' + countryData[index]['deaths'].toString(),
                  style: kSubTextStyle.copyWith(color: kDeathColor, fontWeight: FontWeight.bold)
                ),
              ],
            ),
            const SizedBox(height: 10,)
          ],
        );
      },
      itemCount: 5,
    );
  }
}
