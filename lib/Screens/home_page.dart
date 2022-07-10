import 'dart:async';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../utils/variables.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  status() async {
    locaPermissionStatus = await Permission.location.status;
    calPermissionStatus = await Permission.calendar.status;
    camPermissionStatus = await Permission.camera.status;
    microPermissionStatus = await Permission.microphone.status;
  }

  @override
  initState() {
    super.initState();
    status();
    Timer.periodic(
        const Duration(
          seconds: 2,
        ), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Permissions',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.cyanAccent,
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            GestureDetector(
              onTap: () async {
                PermissionStatus status = await Permission.location.request();
                setState(() {
                  locaPermissionStatus = status;
                });
              },
              child: Container(
                height: 50,
                width: 250,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.cyanAccent,
                ),
                child: const Text(
                  'Location permission',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () async {
                PermissionStatus status = await Permission.calendar.request();
                setState(() {
                  calPermissionStatus = status;
                });
              },
              child: Container(
                height: 50,
                width: 250,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.cyanAccent,
                ),
                child: const Text(
                  'Calendar permission',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () async {
                PermissionStatus status = await Permission.camera.request();
                setState(() {
                  camPermissionStatus = status;
                });
              },
              child: Container(
                height: 50,
                width: 250,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.cyanAccent,
                ),
                child: const Text(
                  'Camera permission',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () async {
                PermissionStatus status = await Permission.microphone.request();
                setState(() {
                  microPermissionStatus = status;
                });
              },
              child: Container(
                height: 50,
                width: 250,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.cyanAccent,
                ),
                child: const Text(
                  'Microphone permission',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        onPressed: () {
          Navigator.of(context).pushNamed('check_permissions');
        },
        child: const Icon(Icons.check_rounded,color: Colors.black,),
      ),
    );
  }
}
