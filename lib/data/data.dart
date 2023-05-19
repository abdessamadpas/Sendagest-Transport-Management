import 'package:sendatrack/constant.dart';
import 'package:flutter/material.dart';
import 'package:ternav_icons/ternav_icons.dart';

import '../model/course_model.dart';
import '../model/planing_model.dart';
import '../model/statistics_model.dart';

final List<Course> course = [
  Course(
      text: "France",
      lessons: "35 Lessons",
      imageUrl: "images/pic/img1.png",
      percent: 75,
      backImage: "images/box/box1.png",
      color: kDarkBlue),
  Course(
      text: "Portugese",
      lessons: "30 Lessons",
      imageUrl: "images/pic/img2.png",
      percent: 50,
      backImage: "images/box/box2.png",
      color: kOrange),
  Course(
      text: "Italian",
      lessons: "20 Lessons",
      imageUrl: "images/pic/img3.png",
      percent: 25,
      backImage: "images/box/box3.png",
      color: kGreen),
  Course(
      text: "German",
      lessons: "40 Lessons",
      imageUrl: "images/pic/img4.png",
      percent: 75,
      backImage: "images/box/box4.png",
      color: kYellow),
];

final List<Planing> planing = [
  Planing(
    heading: "Bricostar SARL",
    subHeadingTime: "8:00 AM - 05/01/2023",
    subHeadingDriver: "Driver: John Doe",
    color: kLightBlue,
    icon: const Icon(
      Icons.car_crash,
      color: kDarkBlue,
    ),
  ),
  Planing(
    heading: "Sostmeier automotive",
    subHeadingTime: "8:00 AM - 05/01/2023",
    subHeadingDriver: "Driver: John Doe",
    color: const Color(0xffE2EDD2),
    icon: Icon(
      Icons.car_rental,
      color: kGreen,
    ),
  ),
  Planing(
    heading: "Sostmeier automotive",
    subHeadingTime: "8:00 AM - 05/01/2023",
    subHeadingDriver: "Driver: John Doe",
    color: const Color(0xffE2EDD2),
    icon: Icon(
      Icons.car_rental,
      color: kGreen,
    ),
  ),
  Planing(
    heading: "Sostmeier automotive",
    subHeadingTime: "8:00 AM - 05/01/2023",
    subHeadingDriver: "Driver: John Doe",
    color: const Color(0xffE2EDD2),
    icon: Icon(
      Icons.car_rental,
      color: kGreen,
    ),
  ),
  Planing(
    heading: "Sostmeier automotive",
    subHeadingTime: "8:00 AM - 05/01/2023",
    subHeadingDriver: "Driver: John Doe",
    color: const Color(0xffE2EDD2),
    icon: Icon(
      Icons.car_rental,
      color: kGreen,
    ),
  ),
  Planing(
    heading: "Sostmeier automotive",
    subHeadingTime: "8:00 AM - 05/01/2023",
    subHeadingDriver: "Driver: John Doe",
    color: const Color(0xffE2EDD2),
    icon: Icon(
      Icons.car_rental,
      color: kGreen,
    ),
  ),
  Planing(
    heading: "Sostmeier automotive",
    subHeadingTime: "8:00 AM - 05/01/2023",
    subHeadingDriver: "Driver: John Doe",
    color: const Color(0xffE2EDD2),
    icon: Icon(
      Icons.car_rental,
      color: kGreen,
    ),
  ),
];

final List<Statistics> statistics = [
  Statistics(
    title: "trajects pending",
    number: "50",
  ),
  Statistics(
    title: "Total trajects Completed",
    number: "250",
  ),
];
