import 'package:flutter/material.dart';
import 'package:dart_eval/dart_eval.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String input = '';

  Widget myButton(String text, [color = Colors.grey]) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        child: ElevatedButton(
          onPressed: () {
            btnClick(text);
          },
          child: Text(
            "$text",
            style: TextStyle(
              fontSize: 35,
            ),
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: (text == '=') ? Colors.redAccent : color[850],
              shape: CircleBorder(),
              padding: EdgeInsets.all(25)),
        ),
      ),
    );
  }

  void btnClick(String text) {
    switch (text) {
      case '=':
        setState(() {
          try {
            input = eval(input).toString();
            if (input == '123456789') {
              Navigator.pushNamed(context, '/home');
            }
          } catch (e) {
            input = "Error";
          }
        });
        break;
      case 'C':
        setState(() {
          input = input.toString().substring(0, input.length - 1);
        });
        break;
      case '+/-':
        setState(() {
          input = (input[0] == '-') ? input.replaceFirst('-', '') : '-$input';
        });
        break;
      case 'x':
        setState(() {
          input = '$input*';
        });
        break;
      case 'AC':
        setState(() {
          input = '';
        });
        break;

      default:
        setState(() {
          input = '$input$text';
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text(
          "Calculator",
          style: TextStyle(letterSpacing: 2),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Container(
                child: Text(
                  '$input',
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    letterSpacing: 3,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                myButton('AC'),
                myButton('C'),
                myButton('%'),
                myButton('/'),
              ],
            ),
            Row(
              children: [
                myButton('7'),
                myButton('8'),
                myButton('9'),
                myButton('x'),
              ],
            ),
            Row(
              children: [
                myButton('4'),
                myButton('5'),
                myButton('6'),
                myButton('-'),
              ],
            ),
            Row(
              children: [
                myButton('1'),
                myButton('2'),
                myButton('3'),
                myButton('+'),
              ],
            ),
            Row(
              children: [
                myButton('+/-'),
                myButton('0'),
                myButton('.'),
                myButton('='),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
