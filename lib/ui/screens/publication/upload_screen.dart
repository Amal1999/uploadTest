// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:upload_test/settings/config.dart';
import 'package:upload_test/ui/screens/publication/widgets/upload_button.dart';
import 'package:upload_test/ui/screens/publication/widgets/upload_field.dart';

import '../home/home_screen.dart';

class UploadScreen extends StatefulWidget {
  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(3, 30, 0, 0),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {

                    },
                    icon: Icon(Icons.arrow_back)),
                Text(
                  "Upload Video",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: context.width * .045
                  ),
                )
              ],
            ),
          ),
          Divider(),
          SizedBox(height: 20,),
          UploadField(label: "video's title"),
          UploadField(label: "Description",maxLines: 3,),
          SizedBox(height: 20,),
          UploadButton(onPressed: (){})
        ],
      ),
    );
  }
}
