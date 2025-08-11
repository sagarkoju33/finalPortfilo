import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:portfolio/view%20model/getx_controllers/portfolio_controller.dart';
import 'package:portfolio/view/intro/components/subtitle_text.dart';
import '../../../view model/responsive.dart';

class CombineSubtitleText extends GetWidget<PortfolioController> {
  const CombineSubtitleText({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 10,
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Obx(
          () => Responsive(
            desktop:
                (controller.portfolioData.value?.stackPositions?.isNotEmpty ??
                    false)
                ? AnimatedTextKit(
                    repeatForever: true,
                    pause: const Duration(milliseconds: 1000),
                    animatedTexts:
                        ((controller
                                .portfolioData
                                .value
                                ?.stackPositions
                                ?.isNotEmpty ??
                            false)
                        ? controller.portfolioData.value!.stackPositions!.map((
                            e,
                          ) {
                            return TyperAnimatedText(
                              e.title ?? "",
                              textStyle: const TextStyle(
                                fontSize: 34,
                                fontWeight: FontWeight.bold,
                              ),
                              speed: const Duration(milliseconds: 40),
                            );
                          }).toList()
                        : [
                            TyperAnimatedText(
                              "Flutter",
                              textStyle: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                              speed: const Duration(milliseconds: 40),
                            ),
                          ]),
                  )
                : CircularProgressIndicator(),

            largeMobile:
                (controller.portfolioData.value?.stackPositions?.isNotEmpty ??
                    false)
                ? AnimatedTextKit(
                    repeatForever: true,
                    pause: const Duration(milliseconds: 1000),
                    animatedTexts:
                        ((controller
                                .portfolioData
                                .value
                                ?.stackPositions
                                ?.isNotEmpty ??
                            false)
                        ? controller.portfolioData.value!.stackPositions!.map((
                            e,
                          ) {
                            return TyperAnimatedText(
                              e.title ?? "",
                              textStyle: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                              speed: const Duration(milliseconds: 40),
                            );
                          }).toList()
                        : [
                            TyperAnimatedText(
                              "Flutter",
                              textStyle: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                              speed: const Duration(milliseconds: 40),
                            ),
                          ]),
                  )
                : CircularProgressIndicator(),
            mobile:
                (controller.portfolioData.value?.stackPositions?.isNotEmpty ??
                    false)
                ? AnimatedTextKit(
                    repeatForever: true,
                    pause: const Duration(milliseconds: 1000),
                    animatedTexts:
                        ((controller
                                .portfolioData
                                .value
                                ?.stackPositions
                                ?.isNotEmpty ??
                            false)
                        ? controller.portfolioData.value!.stackPositions!.map((
                            e,
                          ) {
                            return TyperAnimatedText(
                              e.title ?? "",
                              textStyle: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                              speed: const Duration(milliseconds: 40),
                            );
                          }).toList()
                        : [
                            TyperAnimatedText(
                              "Flutter",
                              textStyle: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                              speed: const Duration(milliseconds: 40),
                            ),
                          ]),
                  )
                : CircularProgressIndicator(),
            tablet:
                (controller.portfolioData.value?.stackPositions?.isNotEmpty ??
                    false)
                ? AnimatedTextKit(
                    repeatForever: true,
                    pause: const Duration(milliseconds: 1000),
                    animatedTexts:
                        ((controller
                                .portfolioData
                                .value
                                ?.stackPositions
                                ?.isNotEmpty ??
                            false)
                        ? controller.portfolioData.value!.stackPositions!.map((
                            e,
                          ) {
                            return TyperAnimatedText(
                              e.title ?? "",
                              textStyle: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                              speed: const Duration(milliseconds: 40),
                            );
                          }).toList()
                        : [
                            TyperAnimatedText(
                              "Flutter",
                              textStyle: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                              speed: const Duration(milliseconds: 40),
                            ),
                          ]),
                  )
                : CircularProgressIndicator(),
          ),
        ),
        AnimatedSubtitleText(
          start: 20,
          end: 32,
          text: ' Developer ',
          gradient: true,
        ),
        // (kIsWeb && Responsive.isLargeMobile(context)
        //     ? const Responsive(
        //         desktop: AnimatedSubtitleText(
        //           start: 20,
        //           end: 34,
        //           text: ' Developer ',
        //           gradient: true,
        //         ),
        //         largeMobile: AnimatedSubtitleText(
        //           start: 20,
        //           end: 34,
        //           text: ' Developer ',
        //           gradient: true,
        //         ),
        //         mobile: AnimatedSubtitleText(
        //           start: 20,
        //           end: 34,
        //           text: ' Developer ',
        //           gradient: true,
        //         ),
        //         tablet: AnimatedSubtitleText(
        //           start: 20,
        //           end: 34,
        //           text: ' Developer ',
        //           gradient: true,
        //         ),
        //       )
        //     : ShaderMask(
        //         shaderCallback: (bounds) {
        //           return const LinearGradient(
        //             colors: [Colors.pink, Colors.blue],
        //           ).createShader(bounds);
        //         },
        //         child: const Responsive(
        //           desktop: AnimatedSubtitleText(
        //             start: 30,
        //             end: 34,
        //             text: ' Developer ',
        //             gradient: false,
        //           ),
        //           largeMobile: AnimatedSubtitleText(
        //             start: 20,
        //             end: 34,
        //             text: ' Developer ',
        //             gradient: false,
        //           ),
        //           mobile: AnimatedSubtitleText(
        //             start: 20,
        //             end: 34,
        //             text: ' Developer ',
        //             gradient: true,
        //           ),
        //           tablet: AnimatedSubtitleText(
        //             start: 20,
        //             end: 34,
        //             text: ' Developer ',
        //             gradient: false,
        //           ),
        //         ),
        //       )),
      ],
    );
  }
}
