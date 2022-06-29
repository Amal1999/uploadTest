// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:upload_test/settings/config.dart';
import 'package:upload_test/settings/const.dart';

class LoginField extends StatefulWidget {
  String label;
  String? error;
  bool? hidden;
  void Function(String) getContent;

  final bool Function(String?)? validator;

  LoginField(
      {Key? key,
      required this.label,
      this.hidden,
      required this.getContent,
      this.validator,
      this.error})
      : super(key: key);

  @override
  State<LoginField> createState() => _LoginFieldState();
}

class _LoginFieldState extends State<LoginField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * .9,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: widget.hidden != null && widget.hidden!,
        controller: _controller,
        onChanged: (value) {
          widget.getContent(value);
        },
        validator: (value) {
          print("validatooor");
          if (widget.validator!=null && !widget.validator!.call(value)) {
            return widget.error;
          }
            return null;

        },
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          suffixIcon: widget.hidden != null
              ? InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      print(widget.hidden);
                      widget.hidden = !widget.hidden!;
                    });
                  },
                  child: Icon(
                    Icons.remove_red_eye_outlined,
                    color: widget.hidden! ? Colors.white38 : Const.iconsColor,
                  ))
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: .6),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Const.iconsColor, width: 1.8),
          ),
          label: Text(
            widget.label.toUpperCase(),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w100),
          ),
        ),
      ),
    );
  }
}
