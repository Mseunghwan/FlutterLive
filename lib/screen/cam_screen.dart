import 'dart:html';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class CamScreen extends StatelessWidget {
  const CamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LIVE'),
      ),
      body: Column(
        children: [

        ],
      )
    );
  }

  // 권한 요청
  Future<bool> init() async {
    final resp = await [Permission.camera, Permission.microphone].request();

    final cameraPermission = resp[Permission.camera];
    final microphonePermission = resp[Permission.microphone];

    if(cameraPermission != PermissionStatus.granted ||
        microphonePermission != PermissionStatus.granted){
      throw '카메라 또는 마이크 권한이 없습니다.';
    }

    return true;
  }
}
