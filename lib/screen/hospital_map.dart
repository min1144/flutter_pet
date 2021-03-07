import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_pet/data/hospital.dart';
import 'package:flutter_pet/dialog/dialog_helper.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../constants.dart';

class HospitalMap extends StatefulWidget {
  @override
  _HospitalMapState createState() => _HospitalMapState();
}

class _HospitalMapState extends State<HospitalMap> {
  double _DEFAULT_LAT = 37.55091766462091;
  double _DEFAULT_LNG = 127.0088441200303;
  double _ZOOM = 13.0;

  final Map<String, Marker> _markers = {};

  Future<void> _onMapCreated(GoogleMapController controller) async {
    final hospitalList = await _loadHospitalList();
    setState(() {
      _markers.clear();
      for (final hospital in hospitalList) {
        String id = hospital.id.toString();
        final marker = Marker(
          markerId: MarkerId(id),
          position: LatLng(hospital.lat, hospital.lng),
          infoWindow: InfoWindow(
              title: hospital.name,
              snippet: hospital.address,
              onTap: () => _onTapHospitalItem(hospital)),
        );
        _markers[id] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(Constants.APP_NAME)),
      body: GoogleMap(
        mapType: MapType.normal,
        myLocationButtonEnabled: false,
        tiltGesturesEnabled: false,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(_DEFAULT_LAT, _DEFAULT_LNG),
          zoom: _ZOOM,
        ),
        markers: _markers.values.toSet(),
      ),
    );
  }

  Future<List<Hospital>> _loadHospitalList() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/hospitals.json");
    final jsonData = json.decode(data);
    return Hospitals.fromJson(jsonData).hospitals;
  }

  void _onTapHospitalItem(Hospital hospital) {
    DialogHelper.showHospitalInfoDialog(context, hospital);
  }
}
