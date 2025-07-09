class Education {
  final String degree;
  final String institution;
  final String duration;
  final String description;
  final String link;

  Education({
    required this.degree,
    required this.institution,
    required this.duration,
    required this.description,
    required this.link,
  });
}

List<Education> educationList = [
  Education(
      degree: 'BE in Computer Engineering',
      institution: 'Khowpa Engineering College\nLibali Bhaktapur, Nepal',
      duration: '🎓 2016',
      description: 'Specializing in Software Development',
      link: 'https://khec.edu.np/'),
  Education(
      degree: '+2 in Science',
      institution: 'Capital College and Research Center\nKathmandu, Nepal',
      duration: '🎓 2014',
      description: 'Major in Mathematics, Physics & Chemistry and computer',
      link: 'https://ccrc.edu.np/'),
];
