import 'package:flutter/material.dart';

import 'package:flutter_quiz/data/questions.dart';
import 'package:flutter_quiz/pages/questions_screen.dart';
import 'package:flutter_quiz/pages/results_screen.dart';
import 'package:flutter_quiz/pages/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? _screenWidget;
  String? _activeScreen;
  List<String> _selectedAnswers = [];

  void chooseAnswer(String answer) {
    _selectedAnswers.add(answer);

    if (_selectedAnswers.length == questions.length) {
      setState(() => _activeScreen = 'results-screen');
    }
  }

  void switchScreen() => setState(() => _activeScreen = 'questions-screen');

  void restartQuiz() {
    setState(() {
      _selectedAnswers = [];
      _activeScreen = 'questions_screen';
    });
  }

  @override
  Widget build(context) {
    _screenWidget = StartScreen(switchScreen);

    if (_activeScreen == 'questions-screen') {
      _screenWidget = QuestionScreen(onSelectAnswer: chooseAnswer);
    }

    if (_activeScreen == 'results-screen') {
      _screenWidget = ResultsScreen(
        chosenAnswers: _selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: _screenWidget,
        ),
      ),
    );
  }
}
