import 'package:flutter/material.dart';
import 'package:permission_accessor/models/per_model_class.dart';

import '../utils/variables.dart';

List<Detail> permissionslist = <Detail>[
  Detail(
      name: "Location",
      icon:  Icon(
        Icons.location_on,
        color: Colors.grey[600],
        size: 30,
      ),
      isAllow: (locaPermissionStatus.toString().split(".")[1] == "denied")
          ? false
          : true),
  Detail(
      name: "Calendar",
      icon:  Icon(
        Icons.calendar_today_outlined,
        color: Colors.grey[600],
        size: 30,
      ),
      isAllow: (calPermissionStatus.toString().split(".")[1] == "denied")
          ? false
          : true),
  Detail(
      name: "Camera",
      icon:  Icon(
        Icons.camera_alt_outlined,
        color: Colors.grey[600],
        size: 30,
      ),
      isAllow: (camPermissionStatus.toString().split(".")[1] == "denied")
          ? false
          : true),

  Detail(
      name: "Microphone",
      icon:  Icon(
        Icons.mic_none_rounded,
        color: Colors.grey[600],
        size: 30,
      ),
      isAllow:
      (microPermissionStatus.toString().split(".")[1] == "denied")
          ? false
          : true),
];