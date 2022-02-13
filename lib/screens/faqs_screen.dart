import 'package:flutter/material.dart';
import 'package:covid19/constant.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQs'),
      ),
      body: ListView.builder(
          itemCount: questionAnswers.length,
          itemBuilder: (BuildContext context, index) {
            return ExpansionTile(
              title: Text(questionAnswers[index]['question'],style: kTitleTextStyle,),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(questionAnswers[index]['answer']),
                ),
              ],
            );
          }),
    );
  }
}
