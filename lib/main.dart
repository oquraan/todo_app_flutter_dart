// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, use_function_type_syntax_for_parameters, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:todo_app_flutter_dart/widgets/counter.dart';
import 'package:todo_app_flutter_dart/widgets/todocart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: ToDoApp(),
    );
  }
}

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class Task {
  String title;
  bool status;
  Task({required this.title, required this.status});
}

class _ToDoAppState extends State<ToDoApp> {
  List l1 = [
    Task(title: "publish", status: true),
    Task(title: "go to gym", status: false),
    Task(title: "sleep", status: true),
    Task(title: "study", status: false)
  ];

  String myTitle = "";
  final mytextfield = TextEditingController();
  int completedTask() {
    int count = 0;
    l1.forEach((element) {
      if (element.status) {
        count++;
      }
    });
    return count;
  }

  void myFunction() {
    setState(() {
      l1.add(Task(title: mytextfield.text, status: false));
    });

    //  myTitle = mytextfield.text;
  }

  changeStatu(index) {
    setState(() {
      l1[index].status = !l1[index].status;
    });
  }

  delete(index) {
    setState(() {
      l1.remove(l1[index]);
    });
  }

  deleteAll() {
    setState(() {
      // for (var i = 0; i < l1.length; i++) {
      //   l1.remove(l1[i]);
      // }

      l1.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //showModalBottomSheet()
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: mytextfield,
                        maxLength: 20,
                        decoration: InputDecoration(
                          labelText: "Add new Task ",
                        ),
                      ),
                      SizedBox(),
                      TextButton(
                          onPressed: () {
                            myFunction();

                            Navigator.pop(context);
                          },
                          child: Text("Add"))
                    ],
                  ),
                  height: 200,
                  width: double.infinity,
                ),
              );
            },
            //  isScrollControlled: true,   using with ShowModelBattonSheet  to show the sheet in full page
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Color.fromRGBO(58, 66, 86, .7),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(58, 66, 86, 1),
        title: Text(
          "To Do App ",
          style: TextStyle(
              fontSize: 33, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                deleteAll();
              },
              icon: Icon(
                Icons.delete_forever,
                color: Color.fromARGB(255, 165, 60, 52),
                size: 32,
              ))
        ],
      ),
      body: Column(
        children: [
          CounterToDo(count: completedTask(), l2: l1),
          Container(
            width: double.infinity,
            //height: double.infinity,
            height: 550,
            child: ListView.builder(
              itemCount: l1.length,
              itemBuilder: (BuildContext context, int index) {
                return ToDoCard(
                  varTitle: l1[index].title,
                  varstatus: l1[index].status,
                  func: changeStatu,
                  funDelete: delete,
                  num: index,
                );
              },
            ),
            // child: SingleChildScrollView(
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [

            //     CounterToDo(count:completedTask() , l2: l1),
            //       ...l1.map((item) => ToDoCard(
            //             varTitle: item.title,
            //             varstatus: item.status,
            //           ))
            //     ],
            //   ),
            // ),
          ),
        ],
      ),
    );
  }
}
