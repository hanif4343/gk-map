import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String title, body;
  final VoidCallback onClose;
  const InfoCard({
    super.key,
    required this.title,
    required this.body,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF0A1A0A),
        border: Border.all(color: const Color(0xFF1A4A1A)),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(.5), blurRadius: 20)],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xFF1A4A1A))),
            ),
            child: Row(children: [
              Expanded(child: Text(title,
                style: const TextStyle(
                  color: Color(0xFF4ADE80),
                  fontWeight: FontWeight.bold,
                  fontSize: 15))),
              GestureDetector(
                onTap: onClose,
                child: const Icon(Icons.close, color: Color(0xFF6B9E6B), size: 20)),
            ]),
          ),
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Text(body,
                style: const TextStyle(
                  color: Color(0xFF9DC89D), fontSize: 13, height: 1.8)),
            ),
          ),
        ],
      ),
    );
  }
}
