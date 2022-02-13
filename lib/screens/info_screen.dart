import 'package:covid19/Widgets/my_header.dart';
import 'package:covid19/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Widgets/widgets.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // The upper clipped part
            MyHeader(
              image: 'assets/icons/coronadr.svg',
              textTop: 'Get to know',
              textBottom: 'About Covid-19.',
              offset: offset,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Symptoms part // horizontal scroll view
                  const Text(
                    'Symptoms',
                    style: kTitleTextStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        SymptomCard(
                          image: 'assets/images/headache.png',
                          title: 'Headache',
                          isActive: true,
                        ),
                        SymptomCard(
                            image: 'assets/images/caugh.png', title: 'Cough'),
                        SymptomCard(
                            image: 'assets/images/fever.png', title: 'Fever'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // Precautions part
                  const Text(
                    'Prevention',
                    style: kTitleTextStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const PrecautionCard(
                      image: 'assets/images/wear_mask.png',
                      title: 'Wear face mask',
                      text:
                      'Since the start of the coronavirus outbreak some places have fully embraced wearing facemasks'),
                  const PrecautionCard(
                      image: 'assets/images/wash_hands.png',
                      title: 'Wash your hands',
                      text:
                      'Since the start of the coronavirus outbreak some places have fully embraced wearing facemasks'),
                  const SizedBox(
                    height: 20,
                  ),

                  // Info_Panels
                  const InfoWidget(),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SymptomCard extends StatelessWidget {
  final String image;

  final String title;
  final bool isActive;

  const SymptomCard({Key? key,
    required this.image,
    required this.title,
    this.isActive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Item shape
    return Container(
      padding: const EdgeInsets.all(10),
      width: (MediaQuery.of(context).size.width -20) /3,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            isActive
                ? BoxShadow(
              offset: const Offset(0, 10),
              blurRadius: 20,
              color: kActiveShadowColor,
            )
                : BoxShadow(
                offset: const Offset(0, 3),
                blurRadius: 6,
                color: kShadowColor)
          ]),
      child: Column(
        children: [
          Image.asset(
            image,
            height: 90,
            fit: BoxFit.contain,
          ),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class PrecautionCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;

  const PrecautionCard(
      {Key? key, required this.image, required this.title, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 156,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [

            // Item shape
            Container(
              height: 136,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 8),
                      blurRadius: 24,
                      color: kShadowColor,
                    ),
                  ]),
            ),

            Image.asset(image),

            // Title, Text and Arrow
            Positioned(
                left: 130,
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  height: 136,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width - 170,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: kTitleTextStyle.copyWith(fontSize: 16),
                      ),
                      Text(
                        text,
                        style: const TextStyle(fontSize: 10),
                      ),
                      Align(
                          alignment: Alignment.topRight,
                          child: SvgPicture.asset('assets/icons/forward.svg')),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
