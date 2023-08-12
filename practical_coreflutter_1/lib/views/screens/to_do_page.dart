import 'package:flutter/material.dart';
import 'package:practical_coreflutter_1/utils/MyRoutes.dart';
import 'package:practical_coreflutter_1/utils/color_utils.dart';

import '../../Globals/Global_class.dart';

class to_do_page extends StatefulWidget {
  const to_do_page({super.key});

  @override
  State<to_do_page> createState() => _to_do_pageState();
}

class _to_do_pageState extends State<to_do_page> {
  TextEditingController title = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  bool check_page = true;

  String title_Todo = "";
  String Date = "";

  int hour = 0;
  int min = 0;
  int sec = 0;

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "To-Do List",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          foregroundColor: theme_5,
          backgroundColor: theme_1,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 30,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    check_page = true;
                  });
                },
                icon: Icon(
                  Icons.add_circle,
                  size: 30,
                )),
            IconButton(
                onPressed: () {
                  setState(() {
                    Navigator.of(context).pushNamed(MyRoutes.pdf_Page);
                  });
                },
                icon: Icon(
                  Icons.picture_as_pdf,
                  size: 30,
                )),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body: Center(
          child: Stack(
            children: [
              ListView.builder(
                  itemCount: Global.to_do_list_String.length,
                  itemBuilder: (context, index) => Card(
                        margin: EdgeInsets.all(10),
                        color: theme_2,
                        child: ListTile(
                          title: Text(
                            "${Global.to_do_list_String[index]}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: theme_4),
                          ),
                          subtitle: Text(
                            "Date : ${Global.to_do_Date[index]}, Time : ${Global.hour[index].toString()}: ${Global.min[index].toString()}: ${Global.sec[index].toString()}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: theme_4,
                                fontStyle: FontStyle.italic),
                          ),
                          trailing: Container(
                            width: 100,
                            height: 50,
                            child: Row(
                              children: [
                                Checkbox(
                                  checkColor: theme_4,

                                  onChanged: (val) {
                                    setState(() {
                                      Global.isDone[index] = val!;
                                    });
                                  },
                                  value: Global.isDone[index],
                                  // value: true,
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        Global.to_do_list_String
                                            .removeAt(index);
                                        Global.hour.removeAt(index);
                                        Global.sec.removeAt(index);
                                        Global.min.removeAt(index);
                                        Global.to_do_Date.removeAt(index);
                                      });
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      // size: 25,
                                      color: theme_4,
                                    ))
                              ],
                            ),
                          ),
                        ),
                      )),
              Spacer(),
              Visibility(
                visible: check_page,
                child: SingleChildScrollView(
                  child: Container(
                    width: w,
                    height: h,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    child: Column(
                      children: [
                        Spacer(),
                        SingleChildScrollView(
                          child: Container(
                            width: w,
                            height: 600,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: theme_1,
                              border: Border.all(color: theme_1, width: 2),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                            ),
                            child: Form(
                              key: formkey,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Add Your To-Do Here",
                                    style:
                                        TextStyle(fontSize: 20, color: theme_4),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.name,
                                    style:
                                        TextStyle(color: theme_4, fontSize: 18),
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "Please Enter Title !!";
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                        focusColor: theme_4,
                                        labelText: "Add To-Do Title",
                                        hintStyle: TextStyle(
                                            color: theme_4, fontSize: 18),
                                        labelStyle: TextStyle(
                                          fontSize: 20,
                                          color: theme_4,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: BorderSide(
                                              color: theme_5,
                                              width: 2,
                                            )),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: BorderSide(
                                              color: theme_2,
                                            )),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide:
                                                BorderSide(color: theme_4))),
                                    onChanged: (val) {
                                      title_Todo = val.toString();
                                    },
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Date",
                                        style: TextStyle(
                                            fontSize: 18, color: theme_4),
                                      )),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.name,
                                    style: TextStyle(color: theme_4),
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        // print("Harshita");
                                        return "Please Enter Date !!";
                                      } else {
                                        // print("Atharva");
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                        focusColor: theme_4,
                                        labelText: "DD/MM/YYYY",
                                        hintStyle: TextStyle(color: theme_4),
                                        labelStyle: TextStyle(
                                          fontSize: 20,
                                          color: theme_3,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: BorderSide(
                                              color: theme_5,
                                              width: 2,
                                            )),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: BorderSide(
                                              color: theme_2,
                                            )),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide:
                                                BorderSide(color: theme_4))),
                                    onChanged: (val) {
                                      Date = val;
                                    },
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Time(HH:MM:SS)",
                                        style: TextStyle(
                                            fontSize: 18, color: theme_4),
                                      )),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: 150,
                                    width: w,
                                    // color: theme_2,
                                    alignment: Alignment.center,
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: w,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              color: theme_3,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                "       Hour",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 22),
                                              ),
                                              Text("     Min",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 22)),
                                              Text("     Sec",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 22))
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Spacer(),
                                            Container(
                                              width: 70,
                                              height: 100,
                                              child: ListWheelScrollView(
                                                itemExtent: 50,
                                                perspective: 0.01,
                                                diameterRatio: 2.5,
                                                squeeze: 1,
                                                onSelectedItemChanged: (val) {
                                                  setState(() {
                                                    hour = val;
                                                  });
                                                },
                                                children: List.generate(
                                                  24,
                                                  (index) => Container(
                                                    width: 80,
                                                    height: 60,
                                                    child: Text(
                                                      "${index}",
                                                      style: TextStyle(
                                                          fontSize: 24,
                                                          color: theme_5,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                            Container(
                                              width: 70,
                                              height: 100,
                                              child: ListWheelScrollView(
                                                itemExtent: 50,
                                                perspective: 0.01,
                                                diameterRatio: 2.5,
                                                squeeze: 1,
                                                onSelectedItemChanged: (val) {
                                                  setState(() {
                                                    min = val;
                                                  });
                                                },
                                                children: List.generate(
                                                  60,
                                                  (index) => Container(
                                                    width: 80,
                                                    height: 60,
                                                    child: Text(
                                                      "${index}",
                                                      style: TextStyle(
                                                          fontSize: 24,
                                                          color: theme_5,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                            Container(
                                              width: 70,
                                              height: 100,
                                              child: ListWheelScrollView(
                                                itemExtent: 50,
                                                perspective: 0.01,
                                                diameterRatio: 2.5,
                                                squeeze: 1,
                                                onSelectedItemChanged: (val) {
                                                  setState(() {
                                                    sec = val;
                                                  });
                                                },
                                                children: List.generate(
                                                  60,
                                                  (index) => Container(
                                                    width: 80,
                                                    height: 60,
                                                    child: Text(
                                                      "${index}",
                                                      style: TextStyle(
                                                          fontSize: 24,
                                                          color: theme_5,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  // Spacer(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            check_page = false;
                                          });
                                        },
                                        child: Container(
                                          width: 150,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: theme_4,
                                            boxShadow: [
                                              BoxShadow(
                                                color: theme_3,
                                                offset: Offset(2, 2),
                                                blurRadius: 2,
                                              )
                                            ],
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Cancel",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: theme_1),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            bool validated = formkey
                                                .currentState!
                                                .validate();
                                            if (validated) {
                                              formkey.currentState!.save();
                                              Global.to_do_list_String
                                                  .add(title_Todo!);
                                              Global.hour.add(hour);
                                              Global.min.add(min);
                                              Global.sec.add(sec);
                                              Global.to_do_Date.add(Date!);
                                              check_page = false;
                                              Global.isDone.add(false);
                                              // Global.time_sort();
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    "Successfully Saved!!",
                                                    style: TextStyle(
                                                        color: theme_1),
                                                  ),
                                                  backgroundColor: theme_4,
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                  duration:
                                                      Duration(seconds: 2),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  margin: EdgeInsets.all(10),
                                                  dismissDirection:
                                                      DismissDirection
                                                          .horizontal,
                                                ),
                                              );
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                      "Failed to Saved!!",
                                                      style: TextStyle(
                                                          color: theme_1)),
                                                  backgroundColor: theme_4,
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                  duration:
                                                      Duration(seconds: 2),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  margin: EdgeInsets.all(10),
                                                  dismissDirection:
                                                      DismissDirection
                                                          .horizontal,
                                                ),
                                              );
                                            }
                                          });
                                        },
                                        child: Container(
                                          width: 150,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: theme_4,
                                            boxShadow: [
                                              BoxShadow(
                                                color: theme_3,
                                                offset: Offset(2, 2),
                                                blurRadius: 2,
                                              )
                                            ],
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Add",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: theme_1),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
