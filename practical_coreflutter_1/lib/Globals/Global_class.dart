import 'package:flutter/material.dart';

class Global {
  static List<String> to_do_list_String = [];
  static List<bool> isDone = [];
  static List<int> hour = [];
  static List<int> min = [];
  static List<int> sec = [];
  static List<String> to_do_Date = [];

  static List<int> time_index = [];

  static void time_sort() {
    List<int> inx = [];

    List<int> total_sec = [];
    for (int i = 0; i < hour.length - 1; i++) {
      total_sec.add((hour[i] * 3600) + (min[i] * 60) + sec[i]);
    }
    int tmp;
    print(total_sec);
    for (int i = 0; i < hour.length; i++) {
      if (total_sec[i] < total_sec[i + 1]) {
        tmp = total_sec[i];
        total_sec[i] = total_sec[i + 1];
        total_sec[i + 1] = tmp;
      }
    }
    print("After");
    print(total_sec);
  }
}

List<Map> To_Do_Map = [];
