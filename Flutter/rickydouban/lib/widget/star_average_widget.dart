import 'package:flutter/material.dart';

class StarAverageWidget extends StatefulWidget {
  final String stars , average;
  StarAverageWidget({Key key , this.stars , this.average}) : super(key: key);
  @override
  _StarAverageWidgetState createState() => _StarAverageWidgetState();
}

class _StarAverageWidgetState extends State<StarAverageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: _getStarCount(),
      ),
    );
  }
  _getStarCount(){
    int starCount = (int.parse(widget.stars) / 10).toInt();
    int allCount = 5;
    allCount = allCount - starCount;
    List<Widget> startWidgetList =  [];
    for(int  i = 0 ; i< starCount; i++){
      startWidgetList.add(
        Padding(
          padding: EdgeInsets.only(left: 0),
          child: Icon(Icons.star , size: 15, color: Colors.orange,),
        )
      );
    }
    if (double.parse(widget.stars) > starCount){
      allCount = allCount - 1;
      startWidgetList.add(
        Padding(
          padding: EdgeInsets.only(left: 0),
          child: Icon(Icons.star_half , size: 15,color: Colors.orange),
        )
      );
    }
      for(int  i = 0 ; i< allCount; i++){
      startWidgetList.add(
        Padding(
          padding: EdgeInsets.only(left: 0),
          child: Icon(Icons.star , size: 15,color: Colors.grey),
        )
      );
    }

    startWidgetList.add(
      Padding(
        padding: EdgeInsets.only(left: 5),
        child: Text(widget.average ,  style: TextStyle(
          fontSize: 12
        ),),
      )
    );
    return startWidgetList;
  }
}