import 'package:flutter/material.dart';
import 'question.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          title: const Text("Quiz Test"),
          centerTitle: true,
        ),
        body: (currentIndex >= questions.length)
            ? Center(
                child: Text("Your score is $score"),
              )
            : Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      questions[currentIndex]['question'].toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            handleClick('1');
                          },
                          child: Text(
                            ((questions[currentIndex]['options']) as List)[0]
                                .toString(),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            handleClick('2');
                          },
                          child: Text(
                            ((questions[currentIndex]['options']) as List)[1]
                                .toString(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            handleClick('3');
                          },
                          child: Text(
                            ((questions[currentIndex]['options']) as List)[2]
                                .toString(),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            handleClick('4');
                          },
                          child: Text(
                            ((questions[currentIndex]['options']) as List)[3]
                                .toString(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ));
  }

 void handleClick(String ans) {
    if (currentIndex < questions.length) {
      setState(() {
        if (ans == questions[currentIndex]['answer']) {
          score++;
        }
        currentIndex++;
      });
    }
  }
}