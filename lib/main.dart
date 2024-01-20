// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/gestures/binding.dart';

import 'question.dart';

void main() {
  runApp(const MaterialApp(
    home: quizApp(),
  ));
}

class quizApp extends StatefulWidget {
  const quizApp({super.key});

  @override
  State<quizApp> createState() => _quizAppState();
}

class _quizAppState extends State<quizApp> {
  int currentIndex = 0;

  List questionBank = [
    myQuestion.name('Nigeria is the most populous country in Africa', true),
    myQuestion.name(
        'The current president of Nigeria is Muhammadu Buhari', true),
    myQuestion.name(
        'Nigeria gained independence from British colonial rule in 1963',
        false),
    myQuestion.name('The capital city of Nigeria is Lagos', false),
    myQuestion.name('Nigeria is a member of the United Nations', true),
    myQuestion.name(
        'The Nigerian Naira is the official currency of Nigeria', true),
    myQuestion.name('Nigeria is the largest oil producer in Africa', true),
    myQuestion.name(
        'The national football team of Nigeria is called the Super Eagles',
        true),
    myQuestion.name('Lagos is the most populous city in Nigeria', true),
    myQuestion.name('English is the official language of Nigeria', true),
    myQuestion.name(
        'Nigeria is currently facing an insurgency led by the terrorist group Boko Haram',
        true),
    myQuestion.name(
        ' Nigeria recently celebrated its 60th Independence Day anniversary',
        true),
    myQuestion.name(
        'The Nigerian economy is heavily dependent on oil export', true),
    myQuestion.name(
        'Nigeria has successfully contained the spread of COVID-19 within its borders',
        false),
    myQuestion.name(
        'Nigeria recently signed the African Continental Free Trade Agreement',
        true),
    myQuestion.name(
        'Nigeria has a higher life expectancy than the global average', false),
    myQuestion.name(
        'The current governor of Lagos State is Babajide Sanwo-Olu', true),
    myQuestion.name(
        ' Nigeria is a member of the OPEC (Organization of the Petroleum Exporting Countries)',
        true),
    myQuestion.name(
        'The Nigerian film industry, known as Nollywood, is the second-largest film industry in the world in terms of output',
        true),
    myQuestion.name(
        'Nigeria recently experienced a decline in youth unemployment rates',
        false),
  ];

  bool get userOption => checkAnwser(userOption, context);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Quiz App'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        margin:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.005),
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.all(20),
                child: Center(child: Image.asset('assets/flag.jpg'))),
            Container(
                padding: EdgeInsets.all(15),
                height: 150,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey)),
                child: Center(
                    child: Text(
                        '${questionBank[currentIndex % (questionBank.length)].questions}'))),
            Container(
              margin: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      previous();
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green, elevation: 5),
                    child: Icon(Icons.arrow_back),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      checkAnwser(true, context);
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green, elevation: 5),
                    child: Text('True'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      checkAnwser(false, context);
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green, elevation: 5),
                    child: Text('False'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      next();
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green, elevation: 5),
                    child: Icon(Icons.arrow_forward_rounded),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  next() {
    setState(() {
      currentIndex++;
    });
  }

  previous() {
    setState(() {
      currentIndex--;
    });
  }

  checkAnwser(bool userOption, BuildContext context) {
    if (userOption == questionBank[currentIndex].isCorrect) {
      final snackbar = SnackBar(content: Text('Yes Correct'));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      currentIndex++;
    } else {
      final snackbar = SnackBar(content: Text('Incorrect'));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      currentIndex++;
    }
  }
}
