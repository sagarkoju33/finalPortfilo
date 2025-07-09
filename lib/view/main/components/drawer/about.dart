import 'package:flutter/material.dart';
import 'package:portfolio/res/constants.dart' show bgColor, defaultPadding;
import 'package:portfolio/view%20model/responsive.dart';

import 'drawer_image.dart';

class About extends StatelessWidget {
  const About({super.key});
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        color: bgColor,
        child: Column(
          children: [
            SizedBox(height: 4),
            const Spacer(flex: 2),
            const DrawerImage(),
            const Spacer(),
            Text('Sagar Koju', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: defaultPadding / 4),
            const Text(
              'Flutter Developer & React Native Developer',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w200, height: 1.5),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Reflects a strong commitment to combining creativity with technical precision, while actively contributing to the wider developer community.",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.w900,
                  height: 0,
                  wordSpacing: 2,
                  fontSize: Responsive.isDesktop(context) ? 16 : 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
