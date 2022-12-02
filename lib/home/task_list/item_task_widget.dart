import 'package:flutter/material.dart';
import 'package:flutter_todo_app_fri_c7/my_theme.dart';

class ItemTaskWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Text('Todo task list',
                style: Theme.of(context).primaryTextTheme.bodyText1,
              ),
              Text('Description',
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
    );
  }
}
