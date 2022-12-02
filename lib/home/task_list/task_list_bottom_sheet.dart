import 'package:flutter/material.dart';

class TaskListBottomSheet extends StatelessWidget {

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
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter task title'
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Enter task description',
                    ),
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
            },
            child: Text('2/12/2022',
              style: Theme.of(context).primaryTextTheme.subtitle2,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 18,),
          ElevatedButton(
              onPressed: (){},
              child: Text('Add',
                style: Theme.of(context).primaryTextTheme.headline1,
              )
          )
        ],
      ),
    );
  }
}
