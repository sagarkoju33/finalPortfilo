class Experience {
  final String title;
  final String company;
  final String duration;
  final String image;
  final List<String> responsibilities;

  Experience({
    required this.title,
    required this.company,
    required this.duration,
    required this.image,
    required this.responsibilities,
  });
}

List<Experience> experienceList = [
  Experience(
    title: 'Mid Level Flutter Developer',
    company: 'MyPay Smart Card Pvt. Ltd.\nKathmandu, Nepal',
    //duration: 'Apr 2024 – Sep 2024',
    duration: 'Apr 2023\n-Ongoing',
    image: 'assets/images/mernInternship.jpeg',

    responsibilities: [
      'Led the development of production-level Flutter applications with robust architecture.',
      'Integrated RESTful APIs and third-party services such as payment gateways and Firebase.',
      'Optimized application performance and responsiveness across multiple platforms.',
      'Maintained and refactored legacy codebases for scalability and maintainability.',
      'Collaborated with UI/UX designers to deliver pixel-perfect mobile interfaces.',
      'Implemented real-time features using GetX for state management and routing.',
      'Conducted peer code reviews and mentored junior developers.',
      'Participated in Agile development cycles and daily stand-ups.',
    ],
  ),
  Experience(
    title: 'Associate Flutter Developer',
    company: 'Worldlink Technologies Pvt. Ltd.\nKathmandu, Nepal',
    // duration: '🗓️ Jul 2019 - Dec 2021',
    duration: 'Aug2022 - Feb2023',
    image: 'assets/images/siddhababa.png',
    responsibilities: [
      'Contributed to the design and development of cross-platform mobile apps.',
      'Utilized Flutter widgets and custom components to build interactive UIs.',
      'Worked closely with QA teams to resolve bugs and ensure quality assurance.',
      'Assisted in deploying apps to Google Play Store and Apple App Store.',
      'Integrated Firebase services for authentication, database, and notifications.',
      'Wrote modular, testable, and clean Dart code following best practices.',
      'Managed app state effectively using Provider and Riverpod.',
      'Collaborated with product managers to refine feature requirements.',
    ],
  ),
  Experience(
    title: 'Associate Flutter Developer',
    company: 'Yellow Nepal Pvt. Ltd.\nKathmandu, Nepal',
    duration: 'May 2021 - Aug 2022',
    responsibilities: [
      'Implemented real-time features using GetX for state management and routing.',
      'Conducted peer code reviews and mentored junior developers.',
      'Assisted in debugging and troubleshooting app issues in production.',
    ],
    image: 'assets/images/himalayan.png',
  ),
];
