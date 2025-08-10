import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/view%20model/getx_controllers/portfolio_controller.dart';
import 'package:portfolio/view/projects/components/project_info.dart';
import '../../../res/constants.dart';

class ProjectGrid extends StatelessWidget {
  final int crossAxisCount;
  final double ratio;

  const ProjectGrid({super.key, this.crossAxisCount = 3, this.ratio = 2});

  @override
  Widget build(BuildContext context) {
    final PortfolioController controller = Get.find();

    return Obx(() {
      final projects = controller.portfolioData.value?.projects ?? [];

      return projects.isNotEmpty
          ? GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              itemCount: projects.length,
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
                  child: ProjectStack(index: index),
                );
              },
            )
          : const Center(child: CircularProgressIndicator());
    });
  }
}
