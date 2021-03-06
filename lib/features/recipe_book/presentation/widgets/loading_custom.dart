import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingCustom extends StatelessWidget {
  const LoadingCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Center(
      child: CupertinoActivityIndicator(
        radius: 20,
      ),
    ));
  }
}
