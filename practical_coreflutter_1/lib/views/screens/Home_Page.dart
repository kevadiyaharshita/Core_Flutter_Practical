import 'package:flutter/material.dart';
import 'package:practical_coreflutter_1/utils/MyRoutes.dart';
import 'package:practical_coreflutter_1/utils/color_utils.dart';
import 'package:practical_coreflutter_1/Globals/Global_class.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "To-Do",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: theme_5, fontSize: 30),
        ),
        backgroundColor: theme_1,
        foregroundColor: theme_5,
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Column(children: [
              SizedBox(
                height: 100,
              ),
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/images/To do list (1).gif'),
                )),
              ),
              Text(
                "Add Your To Do Here",
                style: TextStyle(
                    fontSize: 30, fontWeight: FontWeight.bold, color: theme_1),
              ),
            ]),
          )),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(MyRoutes.to_do_page);
          },
          child: Icon(
            Icons.add,
            size: 30,
          )),
    );
  }
}
