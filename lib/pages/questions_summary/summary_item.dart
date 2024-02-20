import 'package:flutter/material.dart';

import 'package:flutter_application_2/widgets/custom_text.dart';
import 'package:flutter_application_2/pages/questions_summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
            isCorrectAnswer: isCorrectAnswer,
            questionIndex: itemData['question_index'] as int),
        const SizedBox(width: 20),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(itemData['question'] as String),
            const SizedBox(height: 5),
            CustomText.small(
              itemData['user_answer'] as String,
              color: const Color.fromARGB(255, 202, 171, 252),
              decoration: isCorrectAnswer
                  ? TextDecoration.none
                  : TextDecoration.lineThrough,
            ),
            CustomText.small(
              itemData['correct_answer'] as String,
              color: isCorrectAnswer
                  ? const Color.fromARGB(255, 53, 182, 14)
                  : const Color.fromARGB(255, 194, 27, 27),
            ),
          ],
        ))
      ],
    );
  }
}
