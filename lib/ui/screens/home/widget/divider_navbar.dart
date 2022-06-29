import 'package:flutter/material.dart';
import 'package:upload_test/settings/config.dart';

import '../../../../settings/const.dart';

class divider extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom:context.height * .1),
      height: context.height * .1,
      child: Divider(
        thickness: 3.5,
        color: Const.firstDarkColor,
        indent: 10,
        endIndent: 10,
      ),
    );
  }
}
