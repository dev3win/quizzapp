import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizzapp/models/question.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit()
      : super(QuizState(
          questionList: getQuestions(),
          currentQuestionIndex: 0,
          score: 0,
          selectedAnswer: null,
        ));

  void selectAnswer(Answer answer) {
    emit(QuizState(
      questionList: state.questionList,
      currentQuestionIndex: state.currentQuestionIndex,
      score: state.score,
      selectedAnswer: answer,
    ));
  }

  void nextQuestion() {
    int score = state.score;

    if (state.selectedAnswer != null && state.selectedAnswer!.isCorrect) {
      score++;
    }

    if (state.currentQuestionIndex < state.questionList.length - 1) {
      emit(QuizState(
        questionList: state.questionList,
        currentQuestionIndex: state.currentQuestionIndex + 1,
        score: score,
        selectedAnswer: null,
      ));
    }
  }

  void restart() {
    emit(QuizState(
      questionList: getQuestions(),
      currentQuestionIndex: 0,
      score: 0,
      selectedAnswer: null,
    ));
  }
}
