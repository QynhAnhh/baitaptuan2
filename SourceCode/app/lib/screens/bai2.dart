import 'package:flutter/material.dart';

class Student {
  final String name;
  final String? email;
  final String? phone;
  Student(this.name, this.email, this.phone);
}

class StudentListScreen extends StatelessWidget {
  StudentListScreen({super.key});

  final List<Student> students = [
    Student('Nguyễn Văn An', 'an@sv.edu.vn', '0901 234 567'),
    Student('Trần Thị Bình', null, '0912 888 999'),
    Student('Lê Minh Chi', 'chi@sv.edu.vn', null),
    Student('Phạm Quốc Dũng', null, null),
    Student('Võ Thanh Em', 'em@sv.edu.vn', '0933 111 222'),
  ];

  @override
  Widget build(BuildContext context) {
    int missingEmailCount = 0;
    for (var s in students) {
      if (s.email == null) missingEmailCount++;
    }

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          'Danh sách sinh viên',
          style: TextStyle(color: Colors.white), // Đổi chữ tiêu đề thành màu trắng
        ),
        backgroundColor: const Color(0xFF1E3A8A),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      // Dùng Column kết hợp Expanded + SingleChildScrollView để đẩy ô tổng xuống dưới đáy màn hình
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  for (var student in students)
                    Container(
                      // Chỉnh margin sang hai bên nhỏ lại (8 thay vì 16) để card dài ra gần tới viền màn hình
                      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      padding: const EdgeInsets.all(16),
                      width: double.infinity, // Ép card giãn hết chiều ngang có thể
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(student.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          const SizedBox(height: 4),
                          Text('Email: ${student.email ?? "Chưa cập nhật"}',
                              style: TextStyle(color: student.email == null ? Colors.red : Colors.grey)),
                          Text('SĐT: ${student.phone ?? "Chưa cập nhật"}',
                              style: TextStyle(color: student.phone == null ? Colors.red : Colors.grey)),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          // Ô tổng kết nằm cố định ở đáy màn hình
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.blue[50],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tổng: ${students.length} sinh viên', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
                Text('Thiếu email: $missingEmailCount', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
              ],
            ),
          )
        ],
      ),
    );
  }
}