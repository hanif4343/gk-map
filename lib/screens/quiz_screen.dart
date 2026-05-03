import 'package:flutter/material.dart';
import '../data/bd_data.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _idx = 0, _score = 0, _selected = -1;
  bool _answered = false, _done = false;

  void _answer(int i) {
    if (_answered) return;
    setState(() {
      _selected = i;
      _answered = true;
      if (i == kQuizQuestions[_idx].answer) _score++;
    });
    Future.delayed(const Duration(milliseconds: 1200), () {
      if (_idx + 1 >= kQuizQuestions.length) {
        setState(() => _done = true);
      } else {
        setState(() { _idx++; _selected = -1; _answered = false; });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050D05),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A1A0A),
        foregroundColor: const Color(0xFF4ADE80),
        title: const Text('GK Quiz', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: _done ? _buildResult() : _buildQuestion(),
    );
  }

  Widget _buildQuestion() {
    final q = kQuizQuestions[_idx];
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LinearProgressIndicator(
            value: (_idx + 1) / kQuizQuestions.length,
            backgroundColor: const Color(0xFF1A2A1A),
            color: const Color(0xFF4ADE80),
          ),
          const SizedBox(height: 8),
          Text('Question ${_idx + 1}/${kQuizQuestions.length}',
            style: const TextStyle(color: Color(0xFF6B9E6B), fontSize: 12)),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF0A1A0A),
              border: Border.all(color: const Color(0xFF1A4A1A)),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(q.question,
              style: const TextStyle(
                color: Color(0xFFE2E8F0), fontSize: 16,
                height: 1.6, fontWeight: FontWeight.w600)),
          ),
          const SizedBox(height: 20),
          ...List.generate(q.options.length, (i) {
            Color bg = const Color(0xFF0A1A0A);
            Color border = const Color(0xFF1A4A1A);
            Color textColor = const Color(0xFFE2E8F0);
            if (_answered) {
              if (i == q.answer) {
                bg = const Color(0xFF0D3320);
                border = const Color(0xFF4ADE80);
                textColor = const Color(0xFF4ADE80);
              } else if (i == _selected) {
                bg = const Color(0xFF3D0D0D);
                border = const Color(0xFFF87171);
                textColor = const Color(0xFFF87171);
              }
            }
            return GestureDetector(
              onTap: () => _answer(i),
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: bg,
                  border: Border.all(color: border, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(q.options[i],
                  style: TextStyle(color: textColor, fontSize: 15)),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildResult() {
    final pct = (_score / kQuizQuestions.length * 100).round();
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(pct >= 80 ? 'Trophy' : pct >= 50 ? 'Good' : 'Study',
              style: const TextStyle(fontSize: 64, color: Color(0xFF4ADE80))),
            const SizedBox(height: 16),
            Text('$_score / ${kQuizQuestions.length}',
              style: const TextStyle(
                fontSize: 48, fontWeight: FontWeight.w900,
                color: Color(0xFF4ADE80))),
            const SizedBox(height: 8),
            Text(pct >= 80 ? 'Excellent! You are a map expert!'
               : pct >= 50 ? 'Good! Keep learning.'
               : 'Study more!',
              style: const TextStyle(color: Color(0xFF6B9E6B), fontSize: 16)),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => setState(() {
                _idx = 0; _score = 0;
                _selected = -1; _answered = false; _done = false;
              }),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF166534),
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
              child: const Text('Play Again',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
