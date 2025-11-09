import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final bool isPassed;
  final VoidCallback onTap;

  const ExamCard({
    required this.exam,
    required this.isPassed,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isPassed ? Colors.grey[300] : Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                exam.subjectName,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 16),
                  SizedBox(width: 4),
                  Text(
                    '${exam.dateTime.day}.${exam.dateTime.month}.${exam.dateTime.year}',
                  ),
                ],
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.access_time, size: 16),
                  SizedBox(width: 4),
                  Text('${exam.dateTime.hour}:${exam.dateTime.minute}'),
                ],
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.location_on, size: 16),
                  SizedBox(width: 4),
                  Text(exam.rooms.join(', ')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}