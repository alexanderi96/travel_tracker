import 'package:flutter/material.dart';
import '../models/trip.dart';

class TripDetailsScreen extends StatelessWidget {
  final Trip trip;

  TripDetailsScreen({required this.trip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dettagli Viaggio'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Nome del Viaggio: ${trip.name}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text('Creatore: ${trip.creator}'),
            SizedBox(height: 8),
            Text('Luogo Principale: ${trip.mainLocation}'),
            SizedBox(height: 8),
            Text(
              'Luoghi di Interesse:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ...trip.placesOfInterest.map((place) => Text('- $place')).toList(),
            SizedBox(height: 8),
            Text(
              'Spese:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ...trip.expenses.map((expense) => Text('- $expense')).toList(),
          ],
        ),
      ),
    );
  }
}
