import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../res/constants.dart';

class DownloadButton extends StatelessWidget {
  const DownloadButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchUrl(
          Uri.parse(
            'https://drive.google.com/file/d/1XmtMOK5yoVAieCixlnU2YDWAKoBkrdNa/view?usp=drive_link',
          ),
        );
      },
      child: IntrinsicWidth(
        stepWidth: 10,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: defaultPadding / 1.5,
            horizontal: defaultPadding,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.blue,
                offset: Offset(0, -1),
                blurRadius: 5,
              ),
              BoxShadow(color: Colors.red, offset: Offset(0, 1), blurRadius: 5),
            ],
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.pink, Colors.blue],
            ),
          ),
          child: Row(
            // mainAxisSize: MainAxisSize.min, // 👈 important
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Download CV',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Colors.white,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              const Icon(
                FontAwesomeIcons.download,
                color: Colors.white70,
                size: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
