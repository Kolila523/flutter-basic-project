import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChangeToNumberPage extends StatefulWidget {
  const ChangeToNumberPage({super.key});

  @override
  State<ChangeToNumberPage> createState() => _ChangeToNumberPageState();
}

class _ChangeToNumberPageState extends State<ChangeToNumberPage> {
  int? resultNumber;
  String? word;

  convertToNumber() {
    if (word == null || word!.isEmpty) {
      return;
    }
    List<String> formatedWord = word!.split(" ");
    int result = 1;

    for (var splitedWord in formatedWord) {
      splitedWord = splitedWord.replaceAll(" ", '');
      switch (splitedWord.toUpperCase()) {
        case "ONE":
          result = result * 1;
          break;
        case "TWO":
          result = result * 2;
          break;
        case "THREE":
          result = result * 3;
          break;
        case "FOUR":
          result = result * 4;
          break;
        case "FIVE":
          result = result * 5;
          break;
        case "SIX":
          result = result * 6;
          break;
        case "SEVEN":
          result = result * 7;
          break;
        case "EIGHT":
          result = result * 8;
          break;
        case "NINE":
          result = result * 9;
          break;
        case "TEN":
          result = result * 10;
          break;
        case "ELEVEN":
          result = result * 11;
          break;
        case "TWELVE":
          result = result * 12;
          break;
        case "THIRTEEN":
          result = result * 13;
          break;
        case "FOURTEEN":
          result = result * 14;
          break;
        case "FIFTEEN":
          result = result * 15;
          break;
        case "SIXTEEN":
          result = result * 16;
          break;
        case "SEVENTEEN":
          result = result * 17;
          break;
        case "EIGHTTEEN":
          result = result * 18;
          break;
        case "NINETEEN":
          result = result * 19;
          break;
        case "TWENTY":
          result = result * 20;
          break;
        case "HUNDRED":
          result = result * 100;
          break;
        case "THOUNDSAND":
          result = result * 1000;
          break;
        case "MILLIONS":
          result = result * 1000000;
          break;
      }
    }

    setState(() {
      resultNumber = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("Change Word to Number"),
          SizedBox(height: 50),
          Text("Your Number is: $resultNumber"),
          SizedBox(height: 20),
          SizedBox(
            width: 250,
            child: TextField(
              decoration: InputDecoration(label: Text("Word Input")),
              onChanged: (value) {
                setState(() {
                  word = value;
                });
              },
            ),
          ),
          SizedBox(height: 50),
          FilledButton(
            onPressed: () {
              convertToNumber();
            },
            child: Text("Submit"),
          ),
        ],
      ),
    );
  }
}
