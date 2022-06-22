// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ShowIconButton extends StatelessWidget {
  final IconData iconData;
  final Function() pressFunch;
  const ShowIconButton({
    Key? key,
    required this.iconData,
    required this.pressFunch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: pressFunch, icon: Icon(iconData));
  }
}
