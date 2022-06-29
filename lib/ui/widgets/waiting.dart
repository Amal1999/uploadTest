import 'package:flutter/Material.dart';

import '../../settings/const.dart';

class Waiting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Const.iconsColor,
      ),
    );
  }
}