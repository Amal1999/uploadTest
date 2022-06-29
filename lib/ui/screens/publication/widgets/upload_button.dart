// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:upload_test/settings/config.dart';
import 'package:upload_test/settings/const.dart';

class UploadButton extends StatefulWidget {
  void Function() onPressed;
  UploadButton({Key? key, required this.onPressed}) : super(key: key);
  @override
  State<UploadButton> createState() => _UploadButtonState();
}

class _UploadButtonState extends State<UploadButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * .5,
      height: context.height * .07,
      child: FlatButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          color: Const.thirdDarkColor,
          onPressed: widget.onPressed,
          child:Text(
            "Upload",
            style: TextStyle(color: Colors.white),
          )
      ),
    );
  }
}
