import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';
import 'exam_detail_screen.dart';

class ExamListScreen extends StatelessWidget {

  const ExamListScreen({super.key});

  List<Exam> _exams() {
    final now = DateTime.now();
    final data = <Exam>[
      Exam(
        subjectName: 'Мобилни информациски системи',
        dateTime: DateTime(2025, 11, 8, 10, 0),
        rooms: ['A101', 'A102'],
      ),
      Exam(
        subjectName: 'Бази на податоци',
        dateTime: DateTime(2025, 11, 12, 14, 0),
        rooms: ['B201'],
      ),
      Exam(
        subjectName: 'Веб програмирање',
        dateTime: DateTime(2025, 11, 15, 9, 0),
        rooms: ['C301', 'C302'],
      ),
      Exam(
        subjectName: 'Вовед во науката на податоците',
        dateTime: DateTime(2025, 11, 1, 11, 0),
        rooms: ['D401'],
      ),
      Exam(
        subjectName: 'Е-влада',
        dateTime: DateTime(2025, 11, 20, 13, 0),
        rooms: ['E501'],
      ),
      Exam(
        subjectName: 'Основи на роботиката',
        dateTime: DateTime(2025, 11, 22, 15, 0),
        rooms: ['F601'],
      ),
      Exam(
        subjectName: 'Алгоритми и податочни структури',
        dateTime: DateTime(2025, 11, 25, 10, 0),
        rooms: ['G701'],
      ),
      Exam(
        subjectName: 'Бизнис статистика',
        dateTime: DateTime(2025, 11, 27, 14, 0),
        rooms: ['H801'],
      ),
      Exam(
        subjectName: 'Дискретна математика',
        dateTime: DateTime(2025, 11, 29, 9, 0),
        rooms: ['I901'],
      ),
      Exam(
        subjectName: 'Вештачка интелигенција',
        dateTime: DateTime(2025, 12, 1, 11, 0),
        rooms: ['J1001'],
      ),
    ];
    data.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    return data;
  }

  @override
  Widget build(BuildContext context) {
    final exams = _exams();
    return Scaffold(
        appBar: AppBar(
          title: Text('Распоред за испити - 223112'),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: exams.length,
          itemBuilder: (context, i) {
            final exam = exams[i];
            final isPassed = exam.dateTime.isBefore(DateTime.now());
            return ExamCard(
              exam: exam,
              isPassed: isPassed,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExamDetailScreen(exam: exam),
                  ),
                );
              },
            );
          },
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
          color: Theme.of(context).colorScheme.surface,
          child: Badge(
            largeSize: 30,
            backgroundColor: Theme.of(context).colorScheme.surface,
            textColor: Theme.of(context).colorScheme.primary,
            label: Text(
              'Вкупно испити: ${exams.length}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
        )
    );
  }
}