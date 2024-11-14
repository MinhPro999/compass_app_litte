import 'package:flutter/material.dart';
import 'package:homescreen_compassapp/widgets/user_info_bar.dart';
import 'package:homescreen_compassapp/widgets/funtion_gidview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Hiển thị ảnh nền SVG
          Image.asset(
            'assets/images/background.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            color: Colors.black
                .withOpacity(0.1), // Áp dụng màu đen 30% để giảm độ sáng
            colorBlendMode: BlendMode.srcATop,
          ),
          SafeArea(
            child: Column(
              children: [
                const UserInfoBar(), // Đặt bên ngoài SingleChildScrollView
                const SizedBox(height: 8),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Chọn Chức Năng',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Nội dung chính của màn hình

                          const SizedBox(height: 10),
                          GridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              funtionGidview(
                                'assets/images/normal_compass.png',
                                'La bàn cơ bản',
                              ),
                              funtionGidview(
                                'assets/images/24_directions.png',
                                'La bàn theo tuổi',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
