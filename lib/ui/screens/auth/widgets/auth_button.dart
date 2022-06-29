// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:upload_test/settings/config.dart';
class AuthButton extends StatefulWidget {
  Color bgColor;
  String content;
  String? imageUrl;
  void Function() onPressed;

  AuthButton({Key? key, required this.bgColor, required this.content, this.imageUrl,required this.onPressed}) : super(key: key);

  @override
  State<AuthButton> createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * .9,
      height: context.height * .07,
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        color: widget.bgColor,
          onPressed: widget.onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(widget.imageUrl != null)
                Row(children: [
                  SvgPicture.asset(
                    widget.imageUrl!,
                    color: Colors.white,
                    matchTextDirection: true,
                  ),
                  SizedBox(width: context.width * .04,)
                ],
                ),
              Text(
                widget.content,
                style: const TextStyle(color: Colors.white),
              )
            ],
          )),
    );
  }
}
