// To parse this JSON data, do
//
//     final portfolioModel = portfolioModelFromJson(jsonString);

import 'dart:convert';

PortfolioModel portfolioModelFromJson(String str) =>
    PortfolioModel.fromJson(json.decode(str));

String portfolioModelToJson(PortfolioModel data) => json.encode(data.toJson());

class PortfolioModel {
  Intro? intro;
  About? about;
  List<Experience>? experience;
  List<Project>? projects;
  List<Education>? education;
  Contact? contact;

  PortfolioModel({
    this.intro,
    this.about,
    this.experience,
    this.projects,
    this.education,
    this.contact,
  });

  factory PortfolioModel.fromJson(Map<String, dynamic> json) => PortfolioModel(
    intro: json["intro"] == null ? null : Intro.fromJson(json["intro"]),
    about: json["about"] == null ? null : About.fromJson(json["about"]),
    experience: json["experience"] == null
        ? []
        : List<Experience>.from(
            json["experience"]!.map((x) => Experience.fromJson(x)),
          ),
    projects: json["projects"] == null
        ? []
        : List<Project>.from(json["projects"]!.map((x) => Project.fromJson(x))),
    education: json["education"] == null
        ? []
        : List<Education>.from(
            json["education"]!.map((x) => Education.fromJson(x)),
          ),
    contact: json["contact"] == null ? null : Contact.fromJson(json["contact"]),
  );

  Map<String, dynamic> toJson() => {
    "intro": intro?.toJson(),
    "about": about?.toJson(),
    "experience": experience == null
        ? []
        : List<dynamic>.from(experience!.map((x) => x.toJson())),
    "projects": projects == null
        ? []
        : List<dynamic>.from(projects!.map((x) => x.toJson())),
    "education": education == null
        ? []
        : List<dynamic>.from(education!.map((x) => x.toJson())),
    "contact": contact?.toJson(),
  };
}

class About {
  String? id;
  String? lottieUrl;
  String? description1;
  String? description2;
  List<dynamic>? skills;

  About({
    this.id,
    this.lottieUrl,
    this.description1,
    this.description2,
    this.skills,
  });

  factory About.fromJson(Map<String, dynamic> json) => About(
    id: json["_id"],
    lottieUrl: json["lottieURL"],
    description1: json["description1"],
    description2: json["description2"],
    skills: json["skills"] == null
        ? []
        : List<dynamic>.from(json["skills"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "lottieURL": lottieUrl,
    "description1": description1,
    "description2": description2,
    "skills": skills == null ? [] : List<dynamic>.from(skills!.map((x) => x)),
  };
}

class Contact {
  String? id;
  String? name;
  String? gender;
  String? age;
  String? email;
  String? mobile;
  String? address;

  Contact({
    this.id,
    this.name,
    this.gender,
    this.age,
    this.email,
    this.mobile,
    this.address,
  });

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
    id: json["_id"],
    name: json["name"],
    gender: json["gender"],
    age: json["age"],
    email: json["email"],
    mobile: json["mobile"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "gender": gender,
    "age": age,
    "email": email,
    "mobile": mobile,
    "address": address,
  };
}

class Education {
  String? id;
  String? degree;
  String? institution;
  String? duration;
  String? description;
  String? link;

  Education({
    this.id,
    this.degree,
    this.institution,
    this.duration,
    this.description,
    this.link,
  });

  factory Education.fromJson(Map<String, dynamic> json) => Education(
    id: json["_id"],
    degree: json["degree"],
    institution: json["institution"],
    duration: json["duration"],
    description: json["description"],
    link: json["link"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "degree": degree,
    "institution": institution,
    "duration": duration,
    "description": description,
    "link": link,
  };
}

class Experience {
  String? id;
  String? title;
  String? period;
  List<String>? description;
  String? company;

  Experience({
    this.id,
    this.title,
    this.period,
    this.description,
    this.company,
  });

  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
    id: json["_id"],
    title: json["title"],
    period: json["period"],
    description: json["description"] == null
        ? []
        : List<String>.from(json["description"]!.map((x) => x)),
    company: json["company"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "period": period,
    "description": description == null
        ? []
        : List<dynamic>.from(description!.map((x) => x)),
    "company": company,
  };
}

class Intro {
  String? id;
  String? welcomeText;
  String? firstName;
  String? lastName;
  String? caption;
  String? description;

  Intro({
    this.id,
    this.welcomeText,
    this.firstName,
    this.lastName,
    this.caption,
    this.description,
  });

  factory Intro.fromJson(Map<String, dynamic> json) => Intro(
    id: json["_id"],
    welcomeText: json["welcomeText"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    caption: json["caption"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "welcomeText": welcomeText,
    "firstName": firstName,
    "lastName": lastName,
    "caption": caption,
    "description": description,
  };
}

class Project {
  String? id;
  String? title;
  String? description;
  String? image;
  String? link;
  List<String>? technologies;

  Project({
    this.id,
    this.title,
    this.description,
    this.image,
    this.link,
    this.technologies,
  });

  factory Project.fromJson(Map<String, dynamic> json) => Project(
    id: json["_id"],
    title: json["title"],
    description: json["description"],
    image: json["image"],
    link: json["link"],
    technologies: json["technologies"] == null
        ? []
        : List<String>.from(json["technologies"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "description": description,
    "image": image,
    "link": link,
    "technologies": technologies == null
        ? []
        : List<dynamic>.from(technologies!.map((x) => x)),
  };
}
