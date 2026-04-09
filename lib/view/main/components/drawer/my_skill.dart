import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:portfolio/view%20model/getx_controllers/portfolio_controller.dart';

import '../../../../res/constants.dart';

class AnimatedLinearProgressIndicator extends StatelessWidget {
  const AnimatedLinearProgressIndicator({
    super.key,
    required this.percentage,
    required this.title,
    this.image,
  });
  final double percentage;
  final String title;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 2),
      child: TweenAnimationBuilder(
        tween: Tween(begin: 0.0, end: percentage),
        duration: const Duration(seconds: 1),
        builder: (context, value, child) {
          return Column(
            children: [
              Row(
                children: [
                  image!.endsWith(".svg")
                      ? SvgPicture.network(
                          image!,
                          height: 15,
                          width: 15,
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          image!,
                          height: 15,
                          width: 15,
                          fit: BoxFit.cover,
                        ),
                  const SizedBox(width: 5),
                  Text(title, style: const TextStyle(color: Colors.white)),
                  const Spacer(),
                  Text('${(value * 100).toInt().toString()}%'),
                ],
              ),
              const SizedBox(height: defaultPadding / 2),
              LinearProgressIndicator(
                value: value,
                backgroundColor: Colors.black,
                color: Colors.amberAccent,
              ),
            ],
          );
        },
      ),
    );
  }
}

class MySKills extends GetWidget<PortfolioController> {
  const MySKills({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (controller.portfolioData.value?.about?.skills?.isNotEmpty ?? false)
            ? ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount:
                    controller.portfolioData.value?.about?.skills?.length ?? 0,
                itemBuilder: (context, index) {
                  var data =
                      controller.portfolioData.value?.about?.skills?[index];
                  return AnimatedLinearProgressIndicator(
                    percentage: double.parse(data?.level ?? ""),
                    title: data?.name ?? "",
                    image: data?.image ?? "",
                  );
                },
              )
            : Column(
                children: [
                  SizedBox(height: defaultPadding * 5),
                  Center(child: Text("No Data found")),
                ],
              ),
      ],
    );
  }
}
