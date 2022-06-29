import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upload_test/settings/config.dart';

class UploadField extends StatelessWidget {
  String label;
  int? maxLines;

  UploadField({Key? key, required this.label,this.maxLines}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: context.height * .02, horizontal: context.width * .1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                style: TextStyle(
                  fontSize: 13
                ),
                maxLines: maxLines ?? 1,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ))
        ],
      ),
    );
  }
}
