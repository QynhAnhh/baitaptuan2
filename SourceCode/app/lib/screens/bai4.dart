import 'package:flutter/material.dart';

class StudentGrade {
  final String name;
  final double? score;
  StudentGrade(this.name, this.score);
}

class ClassBoardScreen extends StatelessWidget {
  ClassBoardScreen({super.key});

  final List<StudentGrade> students = [
    StudentGrade('Nguyễn Văn An', 9.0),
    StudentGrade('Trần Thị Bình', 7.2),
    StudentGrade('Lê Minh Chi', null),
    StudentGrade('Phạm Quốc Dũng', 4.5),
    StudentGrade('Võ Thanh Em', 5.8),
  ];

  String getGrade(double score) {
    if (score >= 8.0) return 'Giỏi';
    if (score >= 6.5) return 'Khá';
    if (score >= 5.0) return 'Trung bình';
    return 'Yếu';
  }

  Color getGradeColor(double score) {
    if (score >= 8.0) return Colors.green;
    if (score >= 6.5) return Colors.blue;
    if (score >= 5.0) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    double totalScore = 0;
    int gradedCount = 0;
    int missingGradeCount = 0;
    int excellentCount = 0;
    double highestScore = 0;

    for (var s in students) {
      if (s.score != null) {
        totalScore += s.score!;
        gradedCount++;
        if (s.score! >= 8.0) excellentCount++;
        if (s.score! > highestScore) highestScore = s.score!;
      } else {
        missingGradeCount++;
      }
    }

    double avgScore = gradedCount > 0 ? totalScore / gradedCount : 0;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Bảng điểm lớp',
          style: TextStyle(color: Colors.white), // Chỉnh màu chữ tiêu đề thành trắng ở đây
        ),
        backgroundColor: const Color(0xFF1E3A8A), // Màu nền của AppBar
        iconTheme: const IconThemeData(color: Colors.white), // Chỉnh màu icon (nếu có) thành trắng luôn cho đồng bộ
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(color: const Color(0xFF2B4C8C), borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Điểm trung bình lớp', style: TextStyle(color: Colors.white70)),
                    Text(avgScore.toStringAsFixed(2), style: const TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Giỏi', style: TextStyle(color: Colors.white70, fontSize: 12)),
                            Text('$excellentCount', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Chưa có điểm', style: TextStyle(color: Colors.white70, fontSize: 12)),
                            Text('$missingGradeCount', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Cao nhất', style: TextStyle(color: Colors.white70, fontSize: 12)),
                            Text('$highestScore', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text('DANH SÁCH - ${students.length} SINH VIÊN', style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              for (var s in students)
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(s.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          Text(
                            s.score == null ? 'Chưa có điểm' : getGrade(s.score!),
                            style: TextStyle(fontSize: 12, color: s.score == null ? Colors.grey : getGradeColor(s.score!)),
                          )
                        ],
                      ),
                      Text(
                        s.score == null ? '—' : '${s.score}',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      )
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}