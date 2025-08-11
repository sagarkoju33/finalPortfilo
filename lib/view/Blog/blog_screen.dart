import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/view%20model/getx_controllers/portfolio_controller.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../res/constants.dart';

class BlogScreen extends GetWidget<PortfolioController> {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final blogList = controller.portfolioData.value?.blogs ?? [];
    final width = MediaQuery.of(context).size.width;

    // Responsive logic inside the widget
    int crossAxisCount;
    double ratio;
    log("rendering project detail for index: $width");
    if (width >= 1500) {
      crossAxisCount = 4;
      ratio = 2;
    } else if (width >= 1400) {
      crossAxisCount = 3;
      ratio = 2.2;
    } else if (width >= 1100) {
      crossAxisCount = 2;
      ratio = 2.4;
    } else if (width >= 800) {
      crossAxisCount = 2;
      ratio = 1.4;
    } else {
      crossAxisCount = 1;
      ratio = 1.8;
    }

    return blogList.isNotEmpty
        ? LayoutBuilder(
            builder: (context, constraints) {
              return GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                itemCount: blogList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: ratio,
                ),
                itemBuilder: (context, index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(
                      vertical: defaultPadding,
                      horizontal: defaultPadding,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(
                        colors: [Colors.pinkAccent, Colors.blue],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pink,
                          offset: const Offset(-2, 0),
                          blurRadius:
                              (index < controller.hovers.length &&
                                  controller.hovers[index])
                              ? 20
                              : 10,
                        ),
                        BoxShadow(
                          color: Colors.blue,
                          offset: const Offset(2, 0),
                          blurRadius:
                              (index < controller.hovers.length &&
                                  controller.hovers[index])
                              ? 20
                              : 10,
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        launchUrl(Uri.parse(blogList[index].link ?? ''));
                      },
                      child: Card(
                        elevation: 0,
                        margin: const EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        color: bgColor,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 12),
                            Text(
                              blogList[index].title ?? '',
                              style: Theme.of(context).textTheme.titleSmall!
                                  .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: Text(
                                blogList[index].description ?? '',
                                style: Theme.of(context).textTheme.titleSmall!
                                    .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w200,
                                      fontSize: 12,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                maxLines: kIsWeb
                                    ? 8
                                    : GetPlatform.isIOS
                                    ? 5
                                    : 4,
                              ),
                            ),

                            // Padding(
                            //   padding: const EdgeInsets.symmetric(
                            //     horizontal: 8.0,
                            //   ),
                            //   child: Image.network(
                            //     blogList[index].imageUrl ?? '',
                            //     height: 80,
                            //     width: double.infinity,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          )
        : const Center(child: CircularProgressIndicator());
  }
}
