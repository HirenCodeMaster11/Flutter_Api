import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget Catagory(
    {required double h,
    required double w,
    required String img,
    required String name}) {
  return Padding(
    padding: EdgeInsets.only(right: 10),
    child: Column(
      children: [
        Container(
          height: h * 0.11,
          width: w * 0.18,
          decoration: BoxDecoration(
            color: Color(0xffFDD8D9),
            borderRadius: BorderRadius.circular(40),
            image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage(img),
            ),
          ),
        ),
        SizedBox(
          height: h * 0.007,
        ),
        Text(
          name,
          style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w400,
              fontSize: w * 0.045),
        )
      ],
    ),
  );
}

List catagory = [
  {
    'img': 'assets/images/b.png',
    'name': 'Breakfast',
  },
  {
    'img': 'assets/images/r.png',
    'name': 'Lunch',
  },
  {
    'img': 'assets/images/bf.png',
    'name': 'Dinner',
  },
  {
    'img': 'assets/images/d.png',
    'name': 'Drink',
  },
  {
    'img': 'assets/images/ba.png',
    'name': 'Bakery',
  },
];
