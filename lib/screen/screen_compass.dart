import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CompassDetailScreen extends StatelessWidget {
  final String title;
  final String description;
  final String backgroundImagePath = 'assets/svg/screenbg_compass.svg';
  final String compassImagePath = 'assets/images_compass/lb_e1.png';

  const CompassDetailScreen({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Ảnh nền SVG
          SvgPicture.asset(
            backgroundImagePath,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tiêu đề
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Hình ảnh la bàn
                  Center(
                    child: Image.asset(
                      compassImagePath,
                      height: 300, // Thay đổi kích thước phù hợp với thiết kế
                      width: 300,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Mô tả
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
