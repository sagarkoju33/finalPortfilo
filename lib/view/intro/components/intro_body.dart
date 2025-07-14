import 'dart:developer';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import '../../../res/constants.dart';
import '../../../view model/responsive.dart';
import 'animated_texts_componenets.dart';
import 'combine_subtitle.dart';
import 'description_text.dart';
import 'download_button.dart';
import 'headline_text.dart';

class IntroBody extends StatelessWidget {
  const IntroBody({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Responsive.isDesktop(context)
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyPortfolioText(start: 40, end: 50),
                      SizedBox(height: defaultPadding / 2),
                      CombineSubtitleText(),
                      SizedBox(height: defaultPadding / 2),
                      const Responsive(
                        desktop: AnimatedDescriptionText(start: 12, end: 12),
                        largeMobile: AnimatedDescriptionText(
                          start: 12,
                          end: 12,
                        ),
                        mobile: AnimatedDescriptionText(start: 12, end: 12),
                        tablet: AnimatedDescriptionText(start: 17, end: 14),
                      ),
                      SizedBox(height: defaultPadding * 2),
                      DownloadButton(),
                    ],
                  ),
                ),
                const Spacer(),

                Responsive.isDesktop(context)
                    ? const AnimatedImageContainer()
                    : const SizedBox(),
                const Spacer(),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.06),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    AnimatedImageContainer(width: 150, height: 200),
                  ],
                ),
                SizedBox(height: size.height * 0.1),
                const Responsive(
                  desktop: MyPortfolioText(start: 40, end: 50),
                  largeMobile: MyPortfolioText(start: 40, end: 35),
                  mobile: MyPortfolioText(start: 35, end: 30),
                  tablet: MyPortfolioText(start: 50, end: 40),
                ),
                if (kIsWeb && Responsive.isLargeMobile(context))
                  Container(height: defaultPadding),
                const CombineSubtitleText(),
                const SizedBox(height: defaultPadding / 2),
                const Responsive(
                  desktop: AnimatedDescriptionText(start: 14, end: 15),
                  largeMobile: AnimatedDescriptionText(start: 14, end: 12),
                  mobile: AnimatedDescriptionText(start: 12, end: 12),
                  tablet: AnimatedDescriptionText(start: 17, end: 14),
                ),
                const SizedBox(height: defaultPadding * 2),
                SizedBox(
                  width: size.width * 0.5,
                  child: const DownloadButton(),
                ),
              ],
            ),
    );
  }
}
