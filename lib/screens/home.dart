import 'package:bmw/screens/height_widget.dart';
import 'package:bmw/screens/result.dart';
import 'package:bmw/widgets/gender_container.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

double _currentValue = 60;
int weight = 20;
int age = 1;
bool isMale = true;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "BMI Calculator",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        backgroundColor: const Color(0xff24263B),
      ),
      body: Container(
        decoration: BoxDecoration(color: Color(0xff24263B)),
        child: Column(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                child: Row(
                  children: [
                    Expanded(
                        child: GenderContainer(
                      gender: 'Male',
                      imagePath: "assets/images/male.png",
                      isSelected: isMale,
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: GenderContainer(
                      gender: 'Female',
                      imagePath: 'assets/images/female.png',
                      isSelected: !isMale,
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                    )),
                  ],
                ),
              ),
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xff333244)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(
                        "Height",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff8B8C9E)),
                      ),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        "${_currentValue.round()}",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 40),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text("cm"),
                      ),
                    ]),
                    Slider(
                        min: 50,
                        activeColor: Color(0xffE83D67),
                        inactiveColor: Colors.white,
                        thumbColor: Color(0xffE83D67),
                        max: 200,
                        value: _currentValue,
                        onChanged: (value) {
                          setState(() {
                            _currentValue = value;
                          });
                        })
                  ],
                ),
                width: double.infinity,
              ),
            )),
            Container(
              child: Row(
                children: [
                  Expanded(
                      child: HeightWidget(
                    text: "Height",
                    num: weight,
                    conco: Color(0xff24263B),
                    onMinus: () {
                      if (weight > 10) {
                        setState(() {
                          weight--;
                        });
                      }
                    },
                    onAdd: () {
                      setState(() {
                        weight++;
                      });
                    },
                  )),
                  Expanded(
                    child: HeightWidget(
                      text: "Age",
                      num: age,
                      conco: Color(0xff333244),
                      onMinus: () {
                        if (age > 1) {
                          setState(() {
                            age--;
                          });
                        }
                      },
                      onAdd: () {
                        setState(() {
                          age++;
                        });
                      },
                    ),
                  )
                ],
              ),
              width: double.infinity,
              decoration: const BoxDecoration(color: Color(0xff24263B)),
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(30))),
              onPressed: () {
                double bmi =
                    weight / ((_currentValue / 100) * (_currentValue / 100));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Result(
                      result: bmi,
                    ),
                  ),
                );
              },
              color: Color(0xffE83D67),
              height: 100,
              minWidth: 500,
              child: Text(
                "Calculate",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }
}
