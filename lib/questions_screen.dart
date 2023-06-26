import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_test_app/answer_button.dart';
import 'package:quiz_test_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onSelectAnswer, {super.key});

  final void Function(String answer) onSelectAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);

    setState(() {
      currentQuestionIndex += 1;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.aBeeZee(
                  fontSize: 24,
                  color: const Color.fromARGB(255, 205, 223, 237),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledAnswers().map((answer) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: AnswerButton(answer, () {
                    answerQuestion(answer);
                  }),
                ))
          ],
        ),
      ),
    );
  }
}
