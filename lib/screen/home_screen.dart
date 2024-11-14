import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homescreen_compassapp/screen/screen_compass.dart';
import 'package:homescreen_compassapp/widgets/funtion_fullwidth.dart';
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
          SvgPicture.asset(
            'assets/svg/screenbg_compass_home.svg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            colorFilter: ColorFilter.mode(
              Colors.black
                  .withOpacity(0.3), // Áp dụng màu đen 30% để giảm độ sáng
              BlendMode.srcATop,
            ),
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
                          InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CompassDetailScreen(
                                  title: "La bàn bát trạch theo tuổi",
                                  description:
                                      "Mô tả chi tiết cho la bàn bát trạch theo tuổi...",
                                ),
                              ),
                            ),
                            child: funtionFullWidth(
                              'assets/images/old_compass.png',
                              'La bàn bát trạch theo tuổi',
                            ),
                          ),

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
                                'La bàn 24 sơn hướng',
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          funtionFullWidth(
                            'assets/images/old_compass.png',
                            'Thước lỗ ban',
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
