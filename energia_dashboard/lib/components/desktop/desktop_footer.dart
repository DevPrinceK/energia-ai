import 'package:flutter/material.dart';

class DesktopFooter extends StatelessWidget {
  const DesktopFooter({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(230, 230, 230, 1),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      height: 50,
      width: deviceWidth * 0.75,
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Copyright @ 2023 Energia AI. All Rights Reserved"),
            TextButton(
              onPressed: () {},
              child: const Text("Terms of Use | Privacy Policy"),
            ),
            // const Text("Copyright @ 2023 Energia AI. All Rights Reserved"),
          ],
        ),
      ),
    );
  }
}
