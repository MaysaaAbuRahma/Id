import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green,
        hintColor: Colors.white,
      ),
      home: const IDCardPage(),
    );
  }
}

class IDCardPage extends StatelessWidget {
  const IDCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: IDCard(),
      ),
    );
  }
}

class IDCard extends StatelessWidget {
  final String name = "Ahmad Muhammad Ali";
  final String idNumber = "1234567890";
  final String nationality = "Palestinian";
  final String dateOfBirth = "01/01/1990";
  final String issueDate = "01/01/2021";
  final String expiryDate = "01/01/2031";
  final String imageUrl = "images/pngegg.png";

  const IDCard({super.key}); // Placeholder image URL

  Widget _buildInfoBox(String title, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green[200]!, Colors.green[50]!],
        ),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.green, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header with Palestinian National ID
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: const Text(
              'Palestinian National ID',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 10),
          // Photo Section
          Container(
            width: 120,
            height: 120,
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
              border: Border.all(color: Colors.green, width: 3),
            ),
          ),
          // Info Section in Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: _buildInfoBox("Name:", name)),
              const SizedBox(
                width: 10,
              ),
              Expanded(child: _buildInfoBox("ID:", idNumber)),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: _buildInfoBox("Nationality:", nationality)),
              const SizedBox(
                width: 10,
              ),
              Expanded(child: _buildInfoBox("Date of Birth:", dateOfBirth)),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: _buildInfoBox("Issue Date:", issueDate)),
              const SizedBox(
                width: 10,
              ),
              Expanded(child: _buildInfoBox("Expiry Date:", expiryDate)),
            ],
          ),
        ],
      ),
    );
  }
}
