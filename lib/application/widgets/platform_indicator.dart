import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformIndicator extends StatelessWidget {
  const PlatformIndicator({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS 
      ? CupertinoActivityIndicator() 
      : CircularProgressIndicator();
  }
}