import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

class LocationBrain{

  double latitude;
  double longitude;

  Future <void> getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude=position.latitude;
      longitude=position.longitude;
    }
    catch(e){
      print(e);
    }
  }

}