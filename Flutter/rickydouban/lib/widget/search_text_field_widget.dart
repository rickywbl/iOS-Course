import 'package:flutter/material.dart';

class SearchTextFieldWidget extends StatelessWidget {
   final String hintText;
   final VoidCallback onTap;
   final ValueChanged<String> onSubmitted;
    final EdgeInsetsGeometry margin;


   SearchTextFieldWidget({Key key , this.hintText , this.margin ,this.onTap , this.onSubmitted}) : super(key :key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin == null ? EdgeInsets.all(0) : margin,
      width: MediaQuery.of(context).size.width,
      alignment: AlignmentDirectional.center,
      height: 37.0,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 237, 236, 237),
          borderRadius: BorderRadius.circular(24.0)
      ),
      child: TextField(
        onSubmitted: onSubmitted,
        onTap: onTap,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 18,color: Color.fromARGB(255, 176, 176, 176)),
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 5),
          // hintText: hintText,
          suffixIcon: GestureDetector(
            onTap: (){
              print('二维码扫描');
            },
            child: Icon(
            Icons.scanner,
            size: 24,
            color: Color.fromARGB(255, 128, 128, 128),
          ),
          ),
          prefixIcon: Icon(
            Icons.search,
            size: 24,
            color: Color.fromARGB(255, 128, 128, 128),
          ),
        ),
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}