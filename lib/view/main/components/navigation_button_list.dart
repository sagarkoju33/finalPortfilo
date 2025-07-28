import 'package:flutter/material.dart';
import 'package:portfolio/view model/controller.dart';

class NavigationButtonList extends StatelessWidget {
  const NavigationButtonList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> navigationButtons = [
      "Home",
      // "About Us",
      "Experience",
      "Projects",
      "Education",
      "Contact Us",
    ];

    return Container(
      color: Colors.transparent,
      child: SizedBox(
        height: 40,
        child: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          scrollDirection: Axis.horizontal,
          itemCount: navigationButtons.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final e = navigationButtons[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                onTap: () {
                  controller.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  );
                },
                child: Container(
                  // padding: const EdgeInsets.symmetric(horizontal: 12),
                  // decoration: BoxDecoration(
                  //   color: Colors.red,
                  //   borderRadius: BorderRadius.circular(8),
                  // ),
                  alignment: Alignment.center,
                  child: Text(
                    e,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
