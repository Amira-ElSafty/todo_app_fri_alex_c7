import 'package:flutter/material.dart';
import 'package:flutter_todo_app_fri_c7/firebase_utils.dart';
import 'package:flutter_todo_app_fri_c7/model/task.dart';

class TaskListBottomSheet extends StatefulWidget {
  @override
  State<TaskListBottomSheet> createState() => _TaskListBottomSheetState();
}

class _TaskListBottomSheetState extends State<TaskListBottomSheet> {
  String title = '';
  String description = '';
  DateTime selectedDate = DateTime.now();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Add new task',
            style:Theme.of(context).primaryTextTheme.headline2 ,
            textAlign: TextAlign.center,
          ),
          Form(
            key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter task title'
                    ),
                    onChanged: (text){
                      title = text ;
                    },
                    validator: (text){
                      if(text == null || text.isEmpty){
                        return 'Please enter task title';  // not valid
                      }
                      return null ;   // valid
                    },
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Enter task description',
                    ),
                    onChanged: (text){
                      description = text ;
                    },
                    validator: (text){
                      if(text == null || text.isEmpty){
                        return 'Please enter task description'; // invalid
                      }
                      return null ;  // valid
                    },
                    maxLines: 4,
                    minLines: 4,
                  ),
                ],
              ),
          ),
          SizedBox(height: 18,),
          Text('Select Date',style: Theme.of(context).primaryTextTheme.subtitle1),
          SizedBox(height: 18,),
          InkWell(
            onTap: (){
              // show calender
              chosenDate();
            },
            child: Text('${selectedDate.month}/${selectedDate.day}/${selectedDate.year}',
              style: Theme.of(context).primaryTextTheme.subtitle2,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 18,),
          ElevatedButton(
              onPressed: (){
                addTask();
              },
              child: Text('Add',
                style: Theme.of(context).primaryTextTheme.headline1,
              )
          )
        ],
      ),
    );
  }

  void chosenDate() async{
    var chosenDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if(chosenDate != null){
      selectedDate = chosenDate ;
      setState(() {

      });
    }
  }

  void addTask() {
    if(formKey.currentState?.validate() == true){
      // add task
      Task task = Task(
          title: title,
          description: description,
          date: selectedDate.millisecondsSinceEpoch);
      addTaskToFireStore(task).timeout(Duration(milliseconds: 500),onTimeout: (){
        print('task was added successfully');
        Navigator.pop(context);
      });
    }
  }
}
