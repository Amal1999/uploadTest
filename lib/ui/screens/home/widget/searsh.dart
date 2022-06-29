import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:upload_test/settings/config.dart';

import '../../../../settings/const.dart';

class Search extends StatefulWidget {
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {


  @override
  Widget build(BuildContext context) {
    return SizedBox(
            height: context.height * 0.15,
            child:Card(
              child: ListTile(
              leading: CircleAvatar(
                radius: 28,
                backgroundColor: Const.firstDarkColor,
                backgroundImage: NetworkImage('https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'),
              ),
              title: Text('Meriem Ayed',style: TextStyle( fontSize: 15)),
              subtitle: Text('meriem.ayed@gmail.com',style: TextStyle( fontSize: 11)),
              trailing: SvgPicture.asset(
                "assets/icons/Search.svg",
                matchTextDirection: true,
              ),
            ),
            ),

          );
  }
}
