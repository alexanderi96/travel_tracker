import 'package:flutter/material.dart';
import '../widgets/trip_card.dart';
import '../models/trip.dart';
import 'trip_details_screen.dart';

class MainScreen extends StatelessWidget {
  final String userName;

  MainScreen({required this.userName});

  List<Trip> trips = [
    Trip(
      name: 'Viaggio a Tirana',
      creator: 'Utente1',
      mainLocation: 'Tirana, Albania',
      placesOfInterest: ['Luogo 1', 'Luogo 2'],
      expenses: ['Spesa 1', 'Spesa 2'],
      from: DateTime(2022, 12, 25), // Data del viaggio a Tirana
      to: DateTime(2022, 12, 28), // Data del viaggio a Tirana
    ),
    Trip(
      name: 'Viaggio in Germania',
      creator: 'Utente2',
      mainLocation: 'Germania',
      placesOfInterest: ['Luogo 3', 'Luogo 4'],
      expenses: ['Spesa 3', 'Spesa 4'],
      from: DateTime(2023, 5, 15), // Data del viaggio in Germania
      to: DateTime(2023, 5, 25), // Data del viaggio in Germania
    ),
    Trip(
      name: 'Viaggio in Bulgaria',
      creator: 'Utente3',
      mainLocation: 'Bulgaria',
      placesOfInterest: ['Luogo 5', 'Luogo 6'],
      expenses: ['Spesa 5', 'Spesa 6'],
      from: DateTime(2023, 11, 10), // Data del viaggio in Bulgaria
      to: DateTime(2023, 11, 15), // Data del viaggio in Bulgaria
    ),
    Trip(
      name: 'Viaggio in Romania',
      creator: 'Utente4',
      mainLocation: 'Romania',
      placesOfInterest: ['Luogo 7', 'Luogo 8'],
      expenses: ['Spesa 7', 'Spesa 8'],
      from: DateTime(2024, 1, 20), // Data del viaggio in Romania
      to: DateTime(2024, 1, 24), // Data del viaggio in Romania
    ),
  ];
  @override
  Widget build(BuildContext context) {
    trips.sort((a, b) =>
        a.from.compareTo(b.from)); // Ordina i viaggi in base alle date

    return Scaffold(
      appBar: AppBar(
        title: Text('User Management Demo - Welcome'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildTripSection('Viaggi', trips, context),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Logica per creare un nuovo viaggio
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  Widget _buildTripSection(
      String title, List<Trip> trips, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: trips.map((trip) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: TripCard(
                tripName: trip.name,
                tripFromDate: trip.from,
                tripToDate: trip.to,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TripDetailsScreen(trip: trip),
                    ),
                  );
                },
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
