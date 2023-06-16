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
    "Co to jest Cubit?",
    [
      Answer("Architektura aplikacji", false),
      Answer("Zbiór widgetów Fluttera", false),
      Answer("Biblioteka do zarządzania stanem", true),
      Answer("Język programowania", false),
      Answer("Framework do budowy UI", false),
    ],
  ));

  list.add(Question(
    "Jakiej biblioteki jest częścią Cubit?",
    [
      Answer("Redux", false),
      Answer("Provider", false),
      Answer("Riverpod", false),
      Answer("Bloc", true),
      Answer("GetX", false),
    ],
  ));

  list.add(Question(
    "Jaki jest domyślny stan Cubit?",
    [
      Answer("null", false),
      Answer("0", false),
      Answer("undefined", false),
      Answer("Początkowy stan zdefiniowany przez dewelopera", true),
    ],
  ));

  list.add(Question(
    "Czy Cubit posiada strumień do którego można nasłuchiwać zmiany stanu?",
    [
      Answer("Tak", true),
      Answer("Nie", false),
    ],
  ));

  list.add(Question(
    "Jakie są dwa podstawowe elementy zarządzania stanem w bibliotece Bloc?",
    [
      Answer("State i Event", false),
      Answer("Bloc i Provider", false),
      Answer("Cubit i Bloc", true),
      Answer("Cubit i Event", false),
      Answer("State i Cubit", false),
      Answer("Provider i Bloc", false),
    ],
  ));

  return list;
}


