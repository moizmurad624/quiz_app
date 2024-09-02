import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'Questions.dart';


void main() {
  runApp(const quizFull());
}

class quizFull extends StatelessWidget {
  const quizFull({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Quiz(),
    );
  }
}

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  void checkAnswers (bool userGivenAnswer){
    Correct_Answer = Ques_banks[question_numbers].questionAnswer;


    setState((){
    if (userGivenAnswer == Correct_Answer){
      Safekeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          )
      );
      question_numbers++;
    }
    else {
      Safekeeper.add(
          Icon(
            Icons.close,
            color: Colors.red,
          )
      );
      question_numbers++;
    }

  });
        }

  List <Icon> Safekeeper = [];
  List<Question> Ques_banks = [
    Question(questionAnswer: false, questionBank: 'You can lead a cow down stairs but not up stairs.'),
    Question(questionBank: 'Approximately one quarter of human bones are in the feet.', questionAnswer: true),
     Question(questionBank: "A slug's blood is green.", questionAnswer: true),
    Question(questionAnswer: false, questionBank: 'You can lead a cow down stairs but not up stairs.'),
    Question(questionBank: 'Approximately one quarter of human bones are in the feet.', questionAnswer: true),
    Question(questionBank: 'A slug\'s blood is green.', questionAnswer: true),
    Question(questionAnswer: false, questionBank: 'You can lead a cow down stairs but not up stairs.'),
    Question(questionBank: 'Approximately one quarter of human bones are in the feet.', questionAnswer: true),
    Question1(questionBank: 'A slug\'s blood is green.', questionAnswer: true)
  ];

  bool? Correct_Answer; //correctAnswer

  var question_numbers = 0;
  // var questionCount = question_numbers + 1;

   @override
  Widget build(BuildContext context) {

     int questionCount = question_numbers + 1;
     int totalQuestions = Ques_banks.length;

    return Scaffold(
        appBar: AppBar(
          title: Text(
             '$questionCount out of $totalQuestions',
              style: TextStyle(
                  fontSize: 26,
                  color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.grey.shade800,
        ),
        backgroundColor: Colors.grey.shade800,
        body: SafeArea(
            child: Column(
           //  crossAxisAlignment: CrossAxisAlignment.stretch,
             // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Expanded(
                    flex: 5,
                     child: Container(
                       margin: EdgeInsets.only(top: 0,right: 20,left: 20,bottom: 0),
                       child: Center(
                           child:
                           Text(
                             Ques_banks[question_numbers].questionBank != null ? Ques_banks[question_numbers].questionBank! : "",
                             style: TextStyle(fontSize: 26, color: Colors.white),
                           )
                       ),
                     ),
                                    ),
                  Expanded(

                    child: GestureDetector(
                      onTap: (){
                        checkAnswers(true);
                        if (question_numbers == Ques_banks.length) {
                          _showQuizEndAlert(context);
                          question_numbers = 0;
                          Safekeeper = [];
                        }
                      },


                  child: Container(
                    margin: EdgeInsets.only(bottom: 10, left: 20, right: 20, top: 0),
                    child: Center(
                      child: Text('TRUE',
                      style: TextStyle(fontSize: 18,color: Color(0xFF4A21C4)
                      )),
                    ),

                    color: Colors.green,
                  ),
                ),
                  ),

                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        checkAnswers(false);
                        if (question_numbers == Ques_banks.length) {
                          _showQuizEndAlert(context);
                          question_numbers = 0;
                          Safekeeper = [];
                        }
                      },
                     child: Container(
                       margin: EdgeInsets.only(bottom: 10, left: 20, right: 20, top: 0),
                       child: Center(
                         child: Text(
                           'FALSE',
                           style: TextStyle(color: Colors.white,
                           fontSize: 18),
                         ),
                       ),
                       height: 200,
                       width: double.infinity,
                       color: Colors.red,

                     ),
                    ),
                  ),
                Row(
                  children: Safekeeper
                )
              ],
            )
        ),
      );
  }
}


void _showQuizEndAlert(BuildContext context) {
  Alert(
    context: context,
    title: "Quiz Ended",
    desc: "Congratulations! You have completed the quiz.",
    onWillPopActive: true,
    buttons: [
      DialogButton(
        child: Text(
          "OK",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () => Navigator.pop(context),
        color: Colors.blue,
      ),
    ],
  ).show();
}