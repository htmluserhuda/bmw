import 'package:flutter/material.dart';

class HeightWidget extends StatefulWidget {
  const HeightWidget(
      {super.key,
      required this.text,
      required this.num,
      required this.conco,
      required this.onMinus,
      required this.onAdd});
  final String text;
  final int num;
  final Color conco;
  final Function() onMinus;
  final Function() onAdd;

  @override
  State<HeightWidget> createState() => _HeightWidgetState();
}

class _HeightWidgetState extends State<HeightWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 20.0),
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                widget.text,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff8B8C9E)),
              ),
            ),
            Text("${widget.num}",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                )),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xff8B8C9E)),
                    child: IconButton(
                      onPressed: widget.onMinus,
                      icon: Icon(Icons.remove),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xff8B8C9E)),
                    child: IconButton(
                      icon: Icon(Icons.add),
                      onPressed: widget.onAdd,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: widget.conco),
      ),
    );
  }
}
