import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 5,
            child: Center(
              child: Text(
                quizBrain.questionBank[questionNumber].questionText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 27.0,
                ),
                textAlign: TextAlign.center,
              ),
            )),
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: FlatButton(
                onPressed: () {
                  bool correctAnswer =
                      quizBrain.questionBank[questionNumber].questionAnswer;
                  setState(() {
                    questionNumber++;
                    if (correctAnswer == true) {
                      print('User got it right!');
                      scoreKeeper
                          .add(const Icon(Icons.check, color: Colors.green));
                    } else {
                      print('User got it wrong!');
                      scoreKeeper
                          .add(const Icon(Icons.close, color: Colors.red));
                    }
                  });
                },
                color: Colors.green,
                child: const Text('True',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        letterSpacing: 10.0)),
              ),
            )),
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: FlatButton(
                onPressed: () {
                  bool correctAnswer =
                      quizBrain.questionBank[questionNumber].questionAnswer;
                  print(questionNumber);
                  print(correctAnswer);
                  setState(() {
                    questionNumber++;
                    if (correctAnswer == false) {
                      print('User got it right!');
                      scoreKeeper
                          .add(const Icon(Icons.check, color: Colors.green));
                    } else {
                      print('User got it wrong!');
                      scoreKeeper
                          .add(const Icon(Icons.close, color: Colors.red));
                    }
                  });
                },
                color: Colors.red,
                child: const Text('False',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        letterSpacing: 10.0)),
              ),
            )),
        Row(children: scoreKeeper),
      ],
    );
  }
}
