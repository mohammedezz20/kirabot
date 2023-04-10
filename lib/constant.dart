 import 'dart:ui';

import 'package:flutter/material.dart';

Color fromRobotMSG=Color.fromRGBO(218, 218, 218, 1.0);
Color fromuserMSG=Color.fromRGBO(242, 248, 255, 1);
Color usertext=Colors.black;
 Color botText=Color.fromRGBO(73, 73, 73, 1.0);
final chatMessages = [
  {
    "msg": "Hello who are you?",
    "chatIndex": 0,
  },
  {
    "msg":
    "Hello, I am ChatGPT, a large language model developed by OpenAI. I am here to assist you with any information or questions you may have. How can I help you today?",
    "chatIndex": 1,
  },
  {
    "msg": "What is flutter?",
    "chatIndex": 0,
  },
  {
    "msg":
    "Flutter is an open-source mobile application development framework created by Google. It is used to develop applications for Android, iOS, Linux, Mac, Windows, and the web. Flutter uses the Dart programming language and allows for the creation of high-performance, visually attractive, and responsive apps. It also has a growing and supportive community, and offers many customizable widgets for building beautiful and responsive user interfaces.",
    "chatIndex": 1,
  },
  {
    "msg": "Okay thanks",
    "chatIndex": 0,
  },
  {
    "msg":
    "You're welcome! Let me know if you have any other questions or if there's anything else I can help you with.",
    "chatIndex": 1,
  },{
    "msg": "Okay thanks",
    "chatIndex": 0,
  },
  {
    "msg":
    "You're welcome! Let me know if you have any other questions or if there's anything else I can help you with.",
    "chatIndex": 1,
  },
  {
    "msg": "Okay thanks",
    "chatIndex": 0,
  },
  {
    "msg":
    "You're welcome! Let me know if you have any other questions or if there's anything else I can help you with.",
    "chatIndex": 1,
  },
];


List models=[
  "gpt-3.5-turbo",
];
