import 'trip.dart'; // Assicurati di importare il modello Trip se non è già stato fatto

class User {
  final String name;
  List<Trip> trips; // Aggiunto campo per i viaggi dell'utente

  User({required this.name, List<Trip>? trips}) : this.trips = trips ?? [];
}
