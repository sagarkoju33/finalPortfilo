import 'package:flutter/material.dart';
import 'package:portfolio/view/intro/components/social_icon.dart';

import 'package:url_launcher/url_launcher.dart';

class SocialMediaIconColumn extends StatelessWidget {
  const SocialMediaIconColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialMediaIcon(
          icon: 'assets/icons/linkedin.svg',
          onTap: () => launchUrl(
            Uri.parse('https://www.linkedin.com/in/sagar-koju-444442166/'),
          ),
        ),
        SocialMediaIcon(
          icon: 'assets/icons/github.svg',
          onTap: () => launchUrl(Uri.parse('https://github.com/sagarkoju33')),
        ),
        //  SocialMediaIcon(icon: 'assets/icons/instagram.svg',onTap: () => launchUrl(Uri.parse('https://github.com/sagarkoju33')),),
        SocialMediaIcon(
          icon: 'assets/icons/youtube.svg',
          onTap: () =>
              launchUrl(Uri.parse('https://www.youtube.com/@sagarkoju7710')),
        ),
      ],
    );
  }
}
