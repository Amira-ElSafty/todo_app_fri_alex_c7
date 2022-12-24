import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app_fri_c7/firebase_utils.dart';
import 'package:flutter_todo_app_fri_c7/model/task.dart';

class ListProvider extends ChangeNotifier{
  List<Task> taskList = [];
  DateTime selectedDate = DateTime.now();

  getAllTasksFromFireStore()async{
    QuerySnapshot<Task> querySnapshot = await getTaskCollection().get();
    taskList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();

    /// todo filter tasks (selected date)
    /// 9/12/2022   => selected date
    taskList = taskList.where((task){
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(task.date);   //
      if(dateTime.year == selectedDate.year &&
          dateTime.month == selectedDate.month &&
          dateTime.day == selectedDate.day
      ){
        return true ;
      }
      return false ;
    }).toList();
    
    /// todo sort list
    taskList.sort((Task task1 , Task task2){
      DateTime dateTime1 = DateTime.fromMillisecondsSinceEpoch(task1.date);
      DateTime dateTime2= DateTime.fromMillisecondsSinceEpoch(task2.date);
      return dateTime1.compareTo(dateTime2);
    });
    notifyListeners();
  }

  void changeSelectedDate(DateTime newDate){
    selectedDate = newDate ;
    notifyListeners();
  }

}