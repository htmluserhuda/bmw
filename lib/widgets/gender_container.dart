import 'package:flutter/material.dart';

class GenderContainer extends StatelessWidget {
  const GenderContainer(
      {super.key,
      required this.gender,
      required this.imagePath,
      required this.isSelected,
      required this.onTap});
  final String gender;
  final String imagePath;
  final bool isSelected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(imagePath),
              height: 96,
              width: 96,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              gender,
              style: TextStyle(
                fontSize: 20,
                color: Color(0xff8E8C9B),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isSelected ? Color(0xff333244) : Color(0xff24263B),
        ),
      ),
    );
  }
}
