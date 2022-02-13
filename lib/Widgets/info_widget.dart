import 'package:covid19/constant.dart';
import 'package:covid19/screens/faqs_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          color: primaryBlack,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'FAQS',
                style: TextStyle(
                    color: kBackgroundColor, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const FAQScreen()));
                },
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: kBackgroundColor,
                ),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          color: primaryBlack,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'DONATE',
                style: TextStyle(
                    color: kBackgroundColor, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  launch('https://covid19responsefund.org/en/');
                },
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: kBackgroundColor,
                ),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          color: primaryBlack,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'MYTH BUSTERS',
                style: TextStyle(
                    color: kBackgroundColor, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  launch(
                      'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters');
                },
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: kBackgroundColor,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
