import 'package:flutter/material.dart';

class TripCard extends StatelessWidget {
  final String tripName;
  final DateTime tripFromDate;
  final DateTime tripToDate;
  final Function()? onTap;

  TripCard(
      {required this.tripName,
      required this.tripFromDate,
      required this.tripToDate,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tripName,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                'Date: ${_formatDate(tripFromDate)} - ${_formatDate(tripToDate)}',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
