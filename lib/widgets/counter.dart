import 'package:flutter/material.dart';

class CounterToDo extends StatelessWidget {
  int count;
  List l2;
  CounterToDo({required this.count,required this.l2});





  @override
  Widget build(BuildContext context) {
    return   Padding(
              padding: const EdgeInsets.symmetric(horizontal:0),
              child: Container(
                alignment: Alignment.center,
                color: Color.fromARGB(255, 46, 36, 68),
                width: double.infinity,
                height: 50,
                child: Text(
                  " $count  /${l2.length}",
                  style: TextStyle(
                      fontSize: 33,
                      color:  (count==l2.length)?
                     Color.fromARGB(255, 18, 172, 69)
                      :  Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            );
  }
}