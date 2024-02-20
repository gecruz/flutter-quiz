import 'package:flutter/material.dart';

import 'package:flutter_application_2/data/questions.dart';
import 'package:flutter_application_2/pages/questions_summary/questions_summary.dart';
import 'package:flutter_application_2/widgets/custom_text.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.onRestart,
    required this.chosenAnswers,
  });

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalQuestionsNumber = questions.length;
    final correctQuestionsNumber = summaryData
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomText(
                'You answered $correctQuestionsNumber out of $totalQuestionsNumber questions correctly!'),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData),
            TextButton.icon(
              onPressed: onRestart,
              icon: const Icon(Icons.refresh),
              label: const CustomText('Restart Quiz!'),
            )
          ],
        ),
      ),
    );
  }
}
