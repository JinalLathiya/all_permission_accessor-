import 'dart:async';

import 'package:flutter/material.dart';

import '../models/lists.dart';

class Second_page extends StatefulWidget {
  const Second_page({Key? key}) : super(key: key);

  @override
  State<Second_page> createState() => _Second_pageState();
}

class _Second_pageState extends State<Second_page> {
  @override
  initState() {
    super.initState();
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
        title: const Text('Permissions'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 80,
                  bottom: 10,
                ),
                child: Text(
                  'ALLOWED',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: permissionslist
                  .map(
                    (e) => (e.isAllow)
                        ? Padding(
                            padding: const EdgeInsets.only(
                              bottom: 10,
                              left: 40,
                              top: 20,
                            ),
                            child: Row(
                              children: [
                                e.icon,
                                const SizedBox(width: 30),
                                Text(
                                  e.name,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          )
                        : Container(),
                  )
                  .toList(),
            ),
            const Divider(
              thickness: 1.5,
              color: Colors.blue,
            ),
            const SizedBox(
              height: 10,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 80),
                child: Text(
                  'NOT ALLOWED',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: permissionslist
                  .map((e) => (e.isAllow == false)
                      ? Padding(
                          padding: const EdgeInsets.only(
                            bottom: 10,
                            left: 20,
                            top: 20,
                          ),
                          child: Row(
                            children: [
                              e.icon,
                              const SizedBox(width: 28),
                              Text(
                                e.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        )
                      : Container())
                  .toList(),
            ),
            const SizedBox(height: 10),
            const Divider(
              thickness: 1.5,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
