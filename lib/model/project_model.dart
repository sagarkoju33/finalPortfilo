class Project {
  final String name;
  final String description;
  final String image;
  final String link;
  Project(this.name, this.description, this.image, this.link);
}

List<Project> projectList = [
  Project(
    'Movie Application (BLoC)',
    'A powerful movie browsing application developed using Flutter and the BLoC pattern. It features dynamic UI updates, categorized movie listings, and integration with a movie API to deliver up-to-date content seamlessly.',
    'assets/images/movie.png',
    'https://github.com/sagarkoju33/Movie_bloc',
  ),
  Project(
    'KHEC Application',
    'A complete digital companion for Kathmandu Engineering College. It provides access to notices, class routines, exam schedules, faculty details, and more. Designed with a focus on UI/UX and smooth navigation.',
    'assets/images/khec.png',
    'https://github.com/sagarkoju33/KHEC',
  ),
  Project(
    'Article Blog (BLoC)',
    'A clean and modern blogging app powered by BLoC. Users can browse, read, and manage articles with real-time data handling and efficient state management for a seamless experience.',
    'assets/images/blog.png',
    'https://github.com/sagarkoju/ArticleBlog/tree/master',
  ),
  Project(
    'COVID Tracker',
    'A real-time COVID-19 tracker app that displays global and country-wise statistics, safety tips, and interactive charts. Built to spread awareness and help users stay informed.',
    'assets/images/covid.png',
    'https://github.com/sagarkoju/COVID19Tracker',
  ),
  Project(
    'Dice Roller Game',
    'A fun and interactive dice-rolling app built using Flutter. The simple UI and random number logic offer an engaging experience, ideal for learning Flutter basics and animations.',
    'assets/images/dice.png',
    'https://github.com/sagarkoju/Dice-Roller-Game/tree/master',
  ),
  Project(
    'MyPay',
    'MyPay is a versatile mobile wallet application allowing users to pay utility bills, transfer funds, and access financial services through an intuitive interface. Ensures secure transactions and swift operations.',
    'assets/images/mypay.png',
    'https://play.google.com/store/apps/details?id=com.mobile.smartcard',
  ),
  Project(
    'MyPay Gold',
    'An advanced version of the MyPay wallet with added features such as gold savings, investment tracking, and premium services. Designed for a smooth financial experience with rich UI.',
    'assets/images/mypay_gold.png',
    'https://play.google.com/store/apps/details?id=app.mypay.MyPayGold',
  ),
  Project(
    'Xpress Sewa',
    'Xpress Sewa is a multi-service platform that provides access to a wide range of utility services including bill payments, government services, and mobile recharge. Focuses on quick access and user satisfaction.',
    'assets/images/xpress.png',
    'https://play.google.com/store/apps/details?id=transfer.money.com.xpress_sewa',
  ),
  Project(
    'Asan Remit',
    'A trusted remittance company offering fast and secure international money transfers.',
    'assets/images/mypay_gold.png',
    'https://play.google.com/store/apps/details?id=transfer.money.com.asanremit',
  ),
];
