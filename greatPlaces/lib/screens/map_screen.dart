// import 'package:flutter/material.dart';
// import 'package:greatPlaces/models/place.dart';
// import 'package:mapbox_gl/mapbox_gl.dart';

// class MapScreen extends StatefulWidget {
//   final PlaceLocation initialLocation;
//   final bool isSelecting;

//   const MapScreen(
//       {this.initialLocation =
//           const PlaceLocation(latitude: 13.0827, longitude: 80.2707),
//       this.isSelecting = false});

//   @override
//   _MapScreenState createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Your map'),
//       ),
//       body: MapboxMap(
//         accessToken: "pk.eyJ1IjoiZGhhc2RoYSIsImEiOiJja2xpNWxwYXAwZDAyMnBxaWMyYWc4bjR1In0.1Xuj-pIZpY8v541XfINOgA",
//         initialCameraPosition: CameraPosition(
//             target: LatLng(widget.initialLocation.latitude,
//                 widget.initialLocation.longitude),
//             zoom: 16),
//       ),
//     );
//   }
// }
