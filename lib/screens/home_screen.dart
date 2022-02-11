import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Widgets/counter.dart';
import '../Widgets/my_header.dart';
import '../constant.dart';

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
    // TODO: implement initState
    super.initState();
    // controller.addListener(onScroll);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  // This is for moving of the text and the virus.png while drcorona icon is fixed
  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
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
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: const Color(0xFFE5E5E5),
                ),
              ),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/maps-and-flags.svg'),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: DropdownButton(
                        isExpanded: true,
                        underline: const SizedBox(),
                        value: 'Indonesia',
                        icon: SvgPicture.asset('assets/icons/dropdown.svg'),
                        items: <String>[
                          'Indonesia',
                          'Bangladesh',
                          'United States',
                          'Japan'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {}),
                  )
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  // Case update row
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
                            text: 'Newest update Feb 11',
                            style: TextStyle(color: kTextLightColor))
                      ])),
                      const Text(
                        'See details',
                        style: TextStyle(
                            color: kPrimaryColor, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Counter row
                  Container(
                    padding: const EdgeInsets.all(20),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Counter(
                          color: kInfectedColor,
                          number: 1046,
                          title: 'Infected',
                        ),
                        Counter(
                          color: kDeathColor,
                          number: 46,
                          title: 'Deaths',
                        ),
                        Counter(
                          color: kRecovercolor,
                          number: 87,
                          title: 'Recovered',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // Spread of virus row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Spread of Virus',
                        style: kTitleTextStyle,
                      ),
                      Text(
                        'See details',
                        style: TextStyle(
                            color: kPrimaryColor, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),

                  //Map_image container
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.all(20),
                    height: 178,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 10),
                            blurRadius: 30,
                            color: kShadowColor,
                          )
                        ]),
                    child: Image.asset(
                      'assets/images/map.png',
                      fit: BoxFit.contain,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
