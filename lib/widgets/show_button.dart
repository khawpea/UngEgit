// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:ungegat/utility/my_constant.dart';

class ShowBottom extends StatelessWidget {
  final String label;
  final Function() pressFunc;
  const ShowBottom({
    Key? key,
    required this.label,
    required this.pressFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        primary: MyConstant.primary,
        onPrimary: MyConstant.dark,
      ),
      onPressed: pressFunc,
      child: Text(label),
    );
  }
}
