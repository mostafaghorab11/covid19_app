import 'package:flutter/material.dart';

import '../constant.dart';

class Counter extends StatelessWidget {
  final int number;
  final Color color;
  final String title;

  const Counter(
      {Key? key,
        required this.number,
        required this.color,
        required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double num = double.parse((number/1000000).toStringAsFixed(1));
    return Container(
      // width: (MediaQuery.of(context).size.width -20) / 3,
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withOpacity(.26),
            ),
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  // most important property
                  border: Border.all(color: color, width: 2)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '${num}M',
            maxLines: 1,
            style: TextStyle(
              fontSize: 33,
              color: color,
            ),
          ),
          Text(
            title,
            style: kSubTextStyle,
          )
        ],
      ),
    );
  }
}
