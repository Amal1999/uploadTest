import 'package:flutter/material.dart';
import 'package:upload_test/ui/screens/home/widget/searsh.dart';

import '../../../settings/const.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Search(),
          ],
        )
      ),
    );
  }
}


