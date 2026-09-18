import 'package:flutter/material.dart';

class GenderWedgit extends StatelessWidget {
  const GenderWedgit({
    super.key,
    required this.image,
    required this.text,
    required this.isSlected,
    required this.onTap,
  });
  final String image;
  final String text;
  final bool isSlected;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isSlected ? Color(0xff24263B) : Color(0xff333244),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Image.asset(image),
              Text(
                text,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: .w400,
                  color: Color(0xff8B8C9E),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
