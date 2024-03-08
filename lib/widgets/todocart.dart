// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class ToDoCard extends StatelessWidget {
  String varTitle;
  bool varstatus;
  Function func;
  Function funDelete;
  int num;
  ToDoCard({
    required this.varTitle,
    required this.varstatus,
    required this.func,
    required this.num,
    required this.funDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        func(num);
      },
      child: FractionallySizedBox(
        widthFactor: .9,
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 22),
          padding: EdgeInsets.all(22),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color.fromRGBO(209, 224, 224, 0.2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                varTitle,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                decoration:varstatus?TextDecoration.lineThrough:TextDecoration.none,
                    decorationThickness: 2.85,
 
                ),
              ),
              Row(
                children: [
                  Icon(varstatus ? Icons.check : Icons.close,
                      size: 27, color: varstatus ? Colors.green : Colors.red,
                      ),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {
                        funDelete(num);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
