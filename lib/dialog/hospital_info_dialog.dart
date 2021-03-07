import 'package:flutter/material.dart';
import 'package:flutter_pet/data/hospital.dart';
import 'package:flutter_pet/widget/hospital_info_view.dart';

class HospitalInfoDialog extends StatelessWidget {
  static const ROUND = 10.0;
  static const ITEM_MARGIN = 20.0;

  final Hospital hospital;

  HospitalInfoDialog(this.hospital);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(ROUND)),
        backgroundColor: Colors.transparent,
        child: _buildContent(context));
  }

  Widget _buildContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: 300,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.yellow[300],
            borderRadius: BorderRadius.circular(ROUND),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ClipRRect(
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(ROUND)),
                child: Image.network(
                  hospital.image,
                  width: 300,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              HospitalInfoView(
                  hospital.name,
                  Theme.of(context).textTheme.bodyText1,
                  ITEM_MARGIN,
                  ITEM_MARGIN),
              HospitalInfoView(hospital.address,
                  Theme.of(context).textTheme.bodyText2, 0.0, 5.0),
              HospitalInfoView(hospital.phone,
                  Theme.of(context).textTheme.bodyText2, 0.0, 5.0),
              Container(
                height: 50,
                child: HospitalInfoView(hospital.site,
                    Theme.of(context).textTheme.bodyText2, 0.0, 0.0),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
