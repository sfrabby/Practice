import 'package:flutter/material.dart';
import 'Widget/button.dart';

class calculator extends StatefulWidget {
  const calculator({super.key});

  @override
  State<calculator> createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
  String output = '0';
  String input = '0';
  String operator = '';
  double num1 = 0;
  double num2 = 0;

  void buttonPress(String value) {
    setState(() {
      if (value == 'C') {
        operator = "";
        output = "0";
        input = "0";
        num1 = 0;
        num2 = 0;
      }
      else if (value == '⌫') {
        // একটি সংখ্যা কাটার জন্য
        if (input.isNotEmpty && input != '0') {
          input = input.substring(0, input.length - 1);
          if (input.isEmpty) input = '0'; // সব কেটে দিলে যেন ০ দেখায়
          output = input;
        }
      }
      else if (['+', '-', '*', '/'].contains(value)) {
        // কোনো অপারেটর চাপলে প্রথম সংখ্যা সেভ হবে
        num1 = double.parse(input);
        operator = value;
        input = '0'; // নতুন সংখ্যা টাইপ করার জন্য ইনপুট ০ হবে
      }
      else if (value == '=') {
        // হিসাব নিকাশ করার জন্য
        if (operator.isNotEmpty) {
          num2 = double.parse(input);

          if (operator == '+') {
            output = (num1 + num2).toString();
          } else if (operator == '-') {
            output = (num1 - num2).toString(); // এখানে বিয়োগ ঠিক করা হয়েছে
          } else if (operator == '*') {
            output = (num1 * num2).toString();
          } else if (operator == '/') {
            output = (num2 != 0) ? (num1 / num2).toString() : "Error";
          }

          // ফলাফল যদি .0 দিয়ে শেষ হয় (যেমন 5.0), দেখতে সুন্দর করার জন্য .0 বাদ দেওয়া হলো
          if (output.endsWith('.0')) {
            output = output.substring(0, output.length - 2);
          }

          input = output; // পরের হিসাবের সুবিধার্থে আউটপুটকে ইনপুটে রাখা হলো
          operator = "";  // অপারেটর ক্লিয়ার
        }
      }
      else {
        // সংখ্যা বা দশমিক চাপলে
        if (input == '0' && value != '.') {
          input = value; // শুরুতে ০ থাকলে তা নতুন সংখ্যা দিয়ে রিপ্লেস হবে
        } else {
          // অলরেডি ডট থাকলে ডাবল ডট যেন না বসে তার চেক
          if (value == '.' && input.contains('.')) return;
          input += value;
        }
        output = input; // স্ক্রিনে দেখানোর জন্য
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text(
          "calculator",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // স্ক্রিন ডিসপ্লে (আউটপুট বড় করে দেখানোর জন্য Alignment একটু পরিবর্তন করা হয়েছে)
            Container(
              alignment: Alignment.bottomRight,
              height: 200,
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              child: Text(
                output,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 45, // সাইজ ২৫ থেকে ৪৫ করা হয়েছে যেন ক্যালকুলেটরের মতো লাগে
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const Divider(color: Colors.grey),
            const SizedBox(height: 10),

            // row 1
            Row(
              children: [
                BuildButton(onClick: () => buttonPress('7'), text: '7'),
                BuildButton(onClick: () => buttonPress('8'), text: '8'),
                BuildButton(onClick: () => buttonPress('9'), text: '9'),
                BuildButton(
                  onClick: () => buttonPress('/'),
                  text: "/",
                  color: Colors.orangeAccent,
                ),
              ],
            ),
            // row 2
            Row(
              children: [
                BuildButton(onClick: () => buttonPress('4'), text: '4'),
                BuildButton(onClick: () => buttonPress('5'), text: '5'),
                BuildButton(onClick: () => buttonPress('6'), text: '6'),
                BuildButton(
                  onClick: () => buttonPress('*'),
                  text: "*",
                  color: Colors.orangeAccent,
                ),
              ],
            ),
            // row 3
            Row(
              children: [
                BuildButton(onClick: () => buttonPress('1'), text: '1'),
                BuildButton(onClick: () => buttonPress('2'), text: '2'),
                BuildButton(onClick: () => buttonPress('3'), text: '3'),
                BuildButton(
                  onClick: () => buttonPress('-'),
                  text: "-",
                  color: Colors.orangeAccent,
                ),
              ],
            ),
            // row 4
            Row(
              children: [
                BuildButton(onClick: () => buttonPress('00'), text: '00'),
                BuildButton(onClick: () => buttonPress('0'), text: '0'),
                BuildButton(onClick: () => buttonPress('.'), text: '.'),
                BuildButton(
                  onClick: () => buttonPress('+'),
                  text: "+",
                  color: Colors.orangeAccent,
                ),
              ],
            ),
            // row 5
            Row(
              children: [
                BuildButton(
                  onClick: () => buttonPress('C'),
                  text: 'C',
                  color: Colors.redAccent, // দেখতে সুন্দর লাগার জন্য C বাটন লাল করা হলো
                ),
                BuildButton(
                  onClick: () => buttonPress('⌫'),
                  text: '⌫',
                  color: Colors.orangeAccent,
                ),
                BuildButton(
                  onClick: () => buttonPress('='),
                  text: "=",
                  color: Colors.green, // = বাটনটি সবুজ করা হলো
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}