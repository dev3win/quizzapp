import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizzapp/cubit/quiz_cubit.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizCubit, QuizState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey[600],
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Quiz App",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                  ),
                ),
                _questionWidget(state),
                _answerList(state, context),
                _nextButton(state, context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _questionWidget(QuizState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Question ${state.currentQuestionIndex + 1}/${state.questionList.length.toString()}",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.grey[500],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            state.questionList[state.currentQuestionIndex].questionText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }

  Widget _answerList(QuizState state, BuildContext context) {
    return Column(
      children: state.questionList[state.currentQuestionIndex].answersList
          .map((answer) {
        bool isSelected = answer == state.selectedAnswer;
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 8),
          height: 48,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: isSelected ? Colors.white : Colors.black,
              backgroundColor: isSelected ? Colors.grey[500] : Colors.white,
              shape: const StadiumBorder(),
            ),
            onPressed: () {
              context.read<QuizCubit>().selectAnswer(answer);
            },
            child: Text(answer.answerText),
          ),
        );
      }).toList(),
    );
  }

  Widget _nextButton(QuizState state, BuildContext context) {
    bool isLastQuestion =
        state.currentQuestionIndex == state.questionList.length - 1;

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
          shape: const StadiumBorder(),
        ),
        child: Text(isLastQuestion ? "Submit" : "Next"),
        onPressed: () {
          if (isLastQuestion) {
            showDialog(
                context: context,
                builder: (_) => _showScoreDialog(state, context));
          } else {
            context.read<QuizCubit>().nextQuestion();
          }
        },
      ),
    );
  }

  _showScoreDialog(QuizState state, BuildContext context) {
    bool isPassed = state.score >= state.questionList.length * 0.6;
    String title = isPassed ? "Passed!" : "Failed!";

    return Dialog(
      backgroundColor: Colors.grey[600],
      insetPadding: EdgeInsets.zero,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: isPassed
                    ? const Color.fromARGB(255, 133, 251, 137)
                    : const Color.fromARGB(255, 250, 153, 92),
                fontSize: 40,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              "Your score is ${state.score}",
              style: TextStyle(
                color: isPassed
                    ? const Color.fromARGB(255, 133, 251, 137)
                    : const Color.fromARGB(255, 250, 153, 92),
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  shape: const StadiumBorder(),
                ),
                child: const Text("Restart"),
                onPressed: () {
                  context.read<QuizCubit>().restart();
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
