import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CgpaBar extends StatefulWidget {
  final double cgpa;
  final bool avgShow;
  final VoidCallback func;

  const CgpaBar(
      {super.key,
      required this.cgpa,
      required this.avgShow,
      required this.func});

  @override
  State<CgpaBar> createState() => _CgpaBarState();
}

class _CgpaBarState extends State<CgpaBar> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * .05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          bar(w * .6, h * .04),
          ElevatedButton(
            style: ButtonStyle(
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)))),
            onPressed: widget.func,
            child: Text(widget.avgShow ? "CGPA" : "SGPA"),
          )
        ],
      ),
    );
  }

  Widget bar(double w, double h) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Stack(
          children: [
            Container(
              height: h,
              width: w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(w * .5),
                color: Colors.grey.shade400,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 20,
                    spreadRadius: -15,
                    color: Colors.teal,
                  )
                ],
              ),
            ),
            Container(
              height: h,
              width: w * (widget.cgpa / 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(w * .5),
                color: Colors.cyan,
              ),
            ),
          ],
        ),
        Text(
          "CGPA:  ${widget.cgpa}",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
