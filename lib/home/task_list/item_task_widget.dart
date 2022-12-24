import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_todo_app_fri_c7/firebase_utils.dart';
import 'package:flutter_todo_app_fri_c7/model/task.dart';
import 'package:flutter_todo_app_fri_c7/my_theme.dart';

class ItemTaskWidget extends StatelessWidget{
  Task task ;
  ItemTaskWidget({required this.task});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 18),
      child: Slidable(
        // The start action pane is the one at the left or the top side.
        startActionPane: ActionPane(
          // A motion is a widget used to control how the pane animates.
          motion: const ScrollMotion(),
          extentRatio: 0.25,

          // All actions are defined in the children parameter.
          children: [
            // A SlidableAction can have an icon and/or a label.
            SlidableAction(
              onPressed: (context){
                deleteTaskFromFireStore(task).timeout(Duration(milliseconds: 5),onTimeout: (){
                  print('task was deleted successfully');
                });
              },
              backgroundColor: MyThemeData.redColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12)
              ),
              padding: EdgeInsets.all(12),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),

          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: MyThemeData.whiteColor
          ),
          margin: EdgeInsets.all(12),
          padding: EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                color: Theme.of(context).primaryColor,
                height: 80,
                width: 4,
              ),
              Expanded(child: Column(
                children: [
                  Text('${task.title}',
                    style: Theme.of(context).primaryTextTheme.bodyText1,
                  ),
                  Text('${task.description}',
                    style:Theme.of(context).primaryTextTheme.subtitle2 ,
                  )
                ],
              )),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).primaryColor
                ),
                padding: EdgeInsets.symmetric(vertical: 8,horizontal: 24),
                child: Icon(Icons.check,size: 35,color: MyThemeData.whiteColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
