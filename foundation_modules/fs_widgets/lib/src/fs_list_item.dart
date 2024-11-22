import 'package:flutter/material.dart';
class FSListItem extends StatelessWidget {
  const FSListItem({super.key, required this.title, this.onTap});

  final String title;
  final dynamic Function(String? title)? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => onTap!(title) ,
        splashColor: Colors.blue,
        child: Container(
          alignment: Alignment.center,
          height: 60,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
