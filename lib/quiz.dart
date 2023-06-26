import 'package:flutter/material.dart';
import 'package:quiz_test_app/data/questions.dart';
import 'package:quiz_test_app/questions_screen.dart';
import 'package:quiz_test_app/results.screen.dart';
import 'package:quiz_test_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  /*  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  } */

  var activeScreen = 'start-screen';
  List<String> selectedAnswers = [];

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void restarQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionsScreen(chooseAnswer);
    }

    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(selectedAnswers, restarQuiz);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 2, 55, 200),
              Color.fromARGB(255, 160, 3, 3)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
