import 'package:flutter/material.dart';
import 'package:flutter_pet/data/hospital.dart';
import 'package:flutter_pet/dialog/hospital_info_dialog.dart';

class DialogHelper {

  static showHospitalInfoDialog(BuildContext context, Hospital hospital) {
    showDialog(context: context, builder: (BuildContext context) => HospitalInfoDialog(hospital));
  }
}