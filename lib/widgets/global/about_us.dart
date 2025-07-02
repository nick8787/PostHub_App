import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyLarge?.color;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          Text(
            'About Us',
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'PostHub — это учебное приложение для демонстрации работы с микросервисной архитектурой, '
                'включающей регистрацию, авторизацию, создание постов, комментарии и многое другое.',
            style: GoogleFonts.inter(fontSize: 15, height: 1.5, color: textColor),
          ),
          const SizedBox(height: 10),
          Text(
            'Разработано Миколою Щипайло в рамках обучающего курса на Udemy.',
            style: GoogleFonts.inter(fontSize: 13, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
