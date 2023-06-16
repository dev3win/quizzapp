class Question {
  final String questionText;
  final List<Answer> answersList;

  Question(this.questionText, this.answersList);
}

class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestions() {
  List<Question> list = [];

  list.add(Question(
    "What is Cubit?",
    [
      Answer("Application architecture", false),
      Answer("Collection of Flutter widgets", false),
      Answer("State management library", true),
      Answer("Programming language", false),
      Answer("UI building framework", false),
    ],
  ));

  list.add(Question(
    "Which library is Cubit part of?",
    [
      Answer("Redux", false),
      Answer("Provider", false),
      Answer("Riverpod", false),
      Answer("Bloc", true),
      Answer("GetX", false),
    ],
  ));

  list.add(Question(
    "What is the default state of Cubit?",
    [
      Answer("null", false),
      Answer("0", false),
      Answer("undefined", false),
      Answer("Initial state defined by the developer", true),
    ],
  ));

  list.add(Question(
    "Does Cubit have a stream to listen for state changes?",
    [
      Answer("Yes", true),
      Answer("No", false),
    ],
  ));

  list.add(Question(
    "What are the two basic elements of state management in the Bloc library?",
    [
      Answer("State and Event", false),
      Answer("Bloc and Provider", false),
      Answer("Cubit and Bloc", true),
      Answer("Cubit and Event", false),
      Answer("State and Cubit", false),
      Answer("Provider and Bloc", false),
    ],
  ));

  return list;
}
