import 'package:flutter/material.dart';

import 'package:flutter_quiz/data/questions.dart';
import 'package:flutter_quiz/widgets/custom_button.dart';
import 'package:flutter_quiz/widgets/custom_text.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    widget.onSelectAnswer(answer);
    setState(() => currentQuestionIndex++);
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomText(
              currentQuestion.text,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map(
                  (answer) => CustomButton(
                    label: answer,
                    onTap: () => answerQuestion(answer),
                  ),
                )
          ],
        ),
      ),
    );
  }
}
