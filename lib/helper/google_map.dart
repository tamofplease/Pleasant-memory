import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class CustomGoogleMap extends StatefulWidget {
  @override
  _CustomGoogleMapState createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  GoogleMapController mapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{}; 
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(35.6580339,139.7016358),
          zoom: 17.0,
        ),
        onMapCreated: _onMapCreated,
        markers: Set<Marker>.of(markers.values),
      ),
    );
  }
  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
      Marker marker = Marker(
        markerId: MarkerId('a'),
        position: LatLng(35.6580339,139.7016358),
      );
      markers[MarkerId('a')] = marker;
    });
  }
}
