import 'dart:developer';

import 'package:flutter/material.dart';

import '../controller/home_controller.dart';
import '../widgets/pin_code_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Verification',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Enter the code sent to the number',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              '+66932971160',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 30,
            ),
            PinCode(
              pinLengthy: 6,
              onPin: (String text) {
                if (controller.testCase1(text)) {
                  log("error text length < 6  $text");
                } else if (controller.testCase2AndTestCase4(text)) {
                  log("text duplicate >= 2  $text");
                  controller.messageText.add(" Error duplicate numbers or repeating numbers");
                } else if (controller.testCase3(text)) {
                  log("text sort number  >= 2  $text");
                  controller.messageText.add(" Error than 2 consecutive numbers");
                }else{
                  controller.messageText.add("");
                }
                // else if(controller.testCase4(text)){
                //   print("text sort number  duplicate two group  $text");
                // }
              },
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Didn't receive code?",
              style: TextStyle(fontSize: 16, color: Colors.blueAccent),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Resend',
              style: TextStyle(fontSize: 16, color: Colors.blueAccent),
            ),
            StreamBuilder(
              stream: controller.messageText.stream,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasData && (snapshot.data ?? '').isNotEmpty) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        snapshot.data!,
                        style: const TextStyle(fontSize: 16, color: Colors.red),
                      )
                    ],
                  );
                }
                return const SizedBox();
              },
            )
          ],
        ),
      ),
    );
  }
}
