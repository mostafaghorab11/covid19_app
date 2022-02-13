import 'dart:convert';

import 'package:covid19/screens/country_stats.dart';
import 'package:flutter/material.dart';
import '../Widgets/widgets.dart';
import '../constant.dart';
import '../network/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    fetchWorldWideData();
    fetchCountriesData();
    super.initState();
    // controller.addListener(onScroll);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // This is for moving of the text and the virus.png while drcorona icon is fixed
  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  late Map worldDataMap;

  fetchWorldWideData() async {
    final casesJson =
        await TrackerService().getData('https://disease.sh/v3/covid-19/all');
    setState(() {
      worldDataMap = json.decode(casesJson);
    });
  }

  late List countriesData;

  fetchCountriesData() async {
    final casesJson = await TrackerService()
        .getData('https://disease.sh/v3/covid-19/countries?sort=deaths');
    setState(() {
      countriesData = json.decode(casesJson);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: [
            // The upper clipped part
            MyHeader(
              image: 'assets/icons/Drcorona.svg',
              textTop: 'All you need',
              textBottom: 'is stay at home.',
              offset: offset,
            ),

            // The drop down menu
            // Container(
            //   margin: const EdgeInsets.symmetric(horizontal: 20),
            //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            //   height: 60,
            //   width: double.infinity,
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(25),
            //     border: Border.all(
            //       color: const Color(0xFFE5E5E5),
            //     ),
            //   ),
            //   child: Row(
            //     children: [
            //       SvgPicture.asset('assets/icons/maps-and-flags.svg'),
            //       const SizedBox(
            //         width: 20,
            //       ),
            //       Expanded(
            //         child: DropdownButton(
            //             isExpanded: true,
            //             underline: const SizedBox(),
            //             value: 'Indonesia',
            //             icon: SvgPicture.asset('assets/icons/dropdown.svg'),
            //             items: <String>[
            //               'Indonesia',
            //               'Bangladesh',
            //               'United States',
            //               'Japan'
            //             ].map<DropdownMenuItem<String>>((String value) {
            //               return DropdownMenuItem<String>(
            //                 value: value,
            //                 child: Text(value),
            //               );
            //             }).toList(),
            //             onChanged: (value) {}),
            //       )
            //     ],
            //   ),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Case update Text and regional button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                          text: const TextSpan(children: [
                        TextSpan(
                          text: 'Case Update\n',
                          style: kTitleTextStyle,
                        ),
                        TextSpan(
                            text: 'Newest update today',
                            style: TextStyle(color: kTextLightColor))
                      ])),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CountryStats()));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Text(
                            'Regional',
                            style: TextStyle(
                                color: kBackgroundColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Cases' Counter row
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 4),
                            blurRadius: 30,
                            color: kShadowColor,
                          ),
                        ]),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Counter(
                            color: kInfectedColor,
                            number: worldDataMap['cases'],
                            title: 'Infected',
                          ),
                          Counter(
                            color: kDeathColor,
                            number: worldDataMap['deaths'],
                            title: 'Deaths',
                          ),
                          Counter(
                            color: kRecovercolor,
                            number: worldDataMap['recovered'],
                            title: 'Recovered',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // Most Affected Countries
                  const Text(
                    'Most Affected Countries',
                    style: kTitleTextStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    child:
                        MostInfectedCountriesWidget(countryData: countriesData),
                    padding: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 4),
                            blurRadius: 30,
                            color: kShadowColor,
                          ),
                        ]),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // Spread of virus row
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: const [
                  //     Text(
                  //       'Spread of Virus',
                  //       style: kTitleTextStyle,
                  //     ),
                  //     Text(
                  //       'See details',
                  //       style: TextStyle(
                  //           color: kPrimaryColor, fontWeight: FontWeight.w600),
                  //     )
                  //   ],
                  // ),
                  //
                  // //Map_image container
                  // Container(
                  //   margin: const EdgeInsets.only(top: 20),
                  //   padding: const EdgeInsets.all(20),
                  //   height: 178,
                  //   width: double.infinity,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(20),
                  //       color: Colors.white,
                  //       boxShadow: [
                  //         BoxShadow(
                  //           offset: const Offset(0, 10),
                  //           blurRadius: 30,
                  //           color: kShadowColor,
                  //         )
                  //       ]),
                  //   child: Image.asset(
                  //     'assets/images/map.png',
                  //     fit: BoxFit.contain,
                  //   ),
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
