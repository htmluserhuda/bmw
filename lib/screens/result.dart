import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({super.key, required this.result});

  final double result;

  String getResultText(double bmi) {
    if (bmi < 18.5) {
      return "Underweight";
    } else if (bmi >= 18.5 && bmi < 25) {
      return "Normal";
    } else if (bmi >= 25 && bmi < 30) {
      return "Overweight";
    } else {
      return "Obese";
    }
  }

  String getResultMessage(double bmi) {
    if (bmi < 18.5) {
      return "You are underweight. You may need to gain weight. Consult your doctor.";
    } else if (bmi >= 18.5 && bmi < 25) {
      return "You have a normal body weight. Good job!";
    } else if (bmi >= 25 && bmi < 30) {
      return "You are slightly overweight. Consider exercising more.";
    } else {
      return "You are obese. Consult your doctor for advice.";
    }
  }

  @override
  Widget build(BuildContext context) {
    String resultText = getResultText(result);
    String resultMessage = getResultMessage(result);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "BMI Calculator",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        backgroundColor: const Color(0xff24263B),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 15),
            child: Text(
              "Your Result",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xff333244),
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 60.0, right: 60, left: 60, bottom: 20),
                      child: Text(
                        resultText,
                        style: TextStyle(
                            color: Color(0xff21BF73),
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Text(
                      '${result.round()}',
                      style:
                          TextStyle(fontSize: 64, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        resultMessage,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color(0xff8B8C9E)),
                      ),
                    ),
                    SizedBox(
                      height: 140,
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(30))),
              onPressed: () {
                Navigator.pop(context);
              },
              color: Color(0xffE83D67),
              height: 100,
              minWidth: 500,
              child: Text(
                "Re - Calculate",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
    );
  }
}
