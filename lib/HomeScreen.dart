import 'dart:math';
import 'package:have_u_ever/LoserScreen.dart';
import 'package:flutter/material.dart';
import 'package:have_u_ever/WonScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int randomIndex = 0;
  int numberOfAnswerQuestions;
  int numberOfIncorrectQuestions;
  static int numberOfCorrectQuestions = 0;
  _HomeScreenState()
      : numberOfAnswerQuestions = 0,
        numberOfIncorrectQuestions = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Have You Ever',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              alignment: Alignment.center,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  questions[randomIndex],
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    child: Text(
                      'Yes',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    onPressed: () {
                      numberOfAnswerQuestions++;
                      randomIndex = getRandomElement(questions);
                      numberOfCorrectQuestions++;

                      setState(() {
                        if (numberOfCorrectQuestions == 3) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return WonScreen();
                              },
                            ),
                          );
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    child: Text(
                      'No',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    onPressed: () {
                      randomIndex = getRandomElement(questions);
                      numberOfIncorrectQuestions++;
                      numberOfAnswerQuestions++;
                      setState(() {
                        if (numberOfIncorrectQuestions == 3 ||
                            numberOfAnswerQuestions == 5) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return LoserScreen();
                              },
                            ),
                          );
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      padding:
                          EdgeInsets.symmetric(horizontal: 45, vertical: 10),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<String> questions = [
  'Have you ever wrote a letter?',
  'Have you ever smoked a cigarette?',
  'Have you ever had a fight with someone who was too old?',
  'Have you ever been on the radio or on television?',
  'Have you ever stayed awake for an entire night?',
  'Have you ever broken something, like a window, and ran away?',
  'Have you ever won a contest and received a prize?',
  'Have you ever met a famous person or a celebrity?',
];
int getRandomElement<T>(List<T> list) {
  final random = new Random();
  var randomIndex = random.nextInt(questions.length);
  return randomIndex;
}
