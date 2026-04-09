import 'package:flutter/material.dart';

import 'package:portfolio/res/constants.dart';
import 'package:portfolio/view%20model/responsive.dart';
import 'package:portfolio/view/projects/components/title_text.dart';
import 'components/projects_grid.dart';

class ProjectsView extends StatelessWidget {
  ProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Responsive.isLargeMobile(context))
            const SizedBox(height: defaultPadding),
          const TitleText(prefix: 'Latest', title: 'Projects'),
          const SizedBox(height: defaultPadding),
          Expanded(
            child: Responsive(
              desktop: ProjectGrid(crossAxisCount: 2, ratio: 2.7),
              extraLargeScreen: ProjectGrid(
                crossAxisCount: (size.width > 1600 && size.width < 1650
                    ? 3
                    : 4),
                ratio: (size.width == 1920)
                    ? 2.4
                    : (size.width > 1400 && size.width < 1450)
                    ? 1.5
                    : (size.width > 1600 && size.width < 1650)
                    ? 1.8
                    : 1.9,
              ),
              largeMobile: ProjectGrid(crossAxisCount: 1, ratio: 2),
              mobile: ProjectGrid(crossAxisCount: 1, ratio: 1.55),
              tablet: ProjectGrid(ratio: 1.8, crossAxisCount: 2),
            ),
          ),
        ],
      ),
    );
  }
}
