class Question {
  late String questionText;
  late bool questionAnswer;

  // Question(this.questionText, this.questionAnswer);
  Question({required String q, required bool a}) {
    questionText = q;
    questionAnswer = a;
  }
}