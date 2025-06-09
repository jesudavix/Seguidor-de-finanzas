import 'package:flutter/material.dart';

class CardHomeScreen extends StatelessWidget {
  final String name;
  final Icon iconCard;
  final double monto;

  const CardHomeScreen({
    super.key,
    required this.name,
    required this.iconCard,
    required this.monto,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        margin: EdgeInsets.zero,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCard,
                  SizedBox(width: 3),
                  Text(name, style: TextStyle(color: Colors.grey)),
                  SizedBox(width: 15.0),
                ],
              ),
              SizedBox(height: 8),
              Text("\$ $monto", style: TextStyle(fontSize: 30)),
            ],
          ),
        ),
      ),
    );
  }
}
