part of 'quiz_cubit.dart';


class QuizState {
  final List<Question> questionList;
  final int currentQuestionIndex;
  final int score;
  final Answer? selectedAnswer;

  QuizState({
    required this.questionList,
    required this.currentQuestionIndex,
    required this.score,
    this.selectedAnswer,
  });
}
