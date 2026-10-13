import 'package:flutter/material.dart';

class GradingScreen extends StatelessWidget {
  const GradingScreen({super.key});

  String getGrade(double score) {
    if (score < 0 || score > 10) return 'Không hợp lệ';
    if (score >= 8.0) return 'Giỏi';
    if (score >= 6.5) return 'Khá';
    if (score >= 5.0) return 'Trung bình';
    return 'Yếu';
  }

  Color getGradeColor(double score) {
    if (score < 0 || score > 10) return Colors.grey;
    if (score >= 8.0) return Colors.green;
    if (score >= 6.5) return Colors.blue;
    if (score >= 5.0) return Colors.orange;
    return Colors.red;
  }

  Widget _buildCheckRow(String label, double score) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: getGradeColor(score).withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(getGrade(score), style: TextStyle(color: getGradeColor(score), fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double mainScore = 8.5;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Xếp loại học lực',
          style: TextStyle(color: Colors.white), // Chỉnh màu chữ tiêu đề thành trắng ở đây
        ),
        backgroundColor: const Color(0xFF1E3A8A), // Màu nền của AppBar
        iconTheme: const IconThemeData(color: Colors.white), // Chỉnh màu icon (nếu có) thành trắng luôn cho đồng bộ
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  const Text('Điểm trung bình', style: TextStyle(color: Colors.grey)),
                  Text('$mainScore', style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(color: Colors.green[50], borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text(getGrade(mainScore), style: TextStyle(color: getGradeColor(mainScore), fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text('KIỂM TRA THÊM', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  _buildCheckRow('Điểm 9', 9.0),
                  _buildCheckRow('Điểm 7', 7.0),
                  _buildCheckRow('Điểm 5.5', 5.5),
                  _buildCheckRow('Điểm 3', 3.0),
                  _buildCheckRow('Điểm 11', 11.0),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}