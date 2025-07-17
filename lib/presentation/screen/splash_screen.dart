import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/big_button.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

import '../../ui/text_styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold의 배경색은 검정색으로 설정하여 좌우 여백의 검정색과 일치시킴
      //backgroundColor: AppColors.black,
      body: Stack(
        children: [
          // 1. 배경 이미지 (Full Screen)
          Positioned.fill(
            child: Image.asset(
              'assets/images/background_cooking.jpg',
              // ⭐️ 여기에 이미지 경로를 설정하세요. ⭐️
              fit: BoxFit.cover, // 이미지가 전체 영역을 채우도록
            ),
          ),
          // 2. 이미지 위에 투명도를 조절하는 오버레이 (텍스트 가독성을 위해)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter, // 그라데이션 시작점: 컨테이너의 하단 중앙
                  end: Alignment.topCenter, // 그라데이션 끝점: 컨테이너의 상단 중앙
                  colors: const [
                    // 그라데이션 색상 리스트
                    Colors.black, // 하단 시작 지점의 색상 (완전 불투명 검정)
                    Colors.transparent, // 상단 끝 지점의 색상 (완전 투명)
                  ],
                  // stops: [0.0, 0.6], // 선택 사항: 각 색상의 전환 시점을 정교하게 제어
                  // 여기서는 기본값 (0.0과 1.0)을 사용하여 부드럽게 전환
                ),
              ),
            ),
          ),
          // 4. 중앙 콘텐츠 (요리사 모자, 텍스트, 버튼)
          Positioned.fill(
            child: Column(
              children: [
                // 요리사 모자 아이콘 (이미지에서 흰색 윤곽선)
                Padding(
                  padding: const EdgeInsets.only(top: 92.0), // 상단 패딩
                  child: Image.asset(
                    'assets/icons/chef_hat.png',
                    height: 79, // 이미지 크기 조절
                    width: 79,
                    color: AppColors.white, // 흰색으로 필터링
                  ),
                ),
                const SizedBox(height: 14), // 간격
                // 100K+ Premium Recipe 텍스트
                Text(
                  '100K+ Premium Recipe',
                  style: TextStyles.mediumTextBold.copyWith(color: AppColors.white),
                ),
                Spacer(),
                // Get Cooking 타이틀
                Text(
                  'Get\nCooking', // 줄바꿈
                  textAlign: TextAlign.center,
                  style: TextStyles.titleTextBold,
                ),
                const SizedBox(height: 20), // 간격
                Text(
                  'Simple way to find Tasty Recipe',
                  textAlign: TextAlign.center,
                  style: TextStyles.normalTextRegular,
                ),
                SizedBox(height: 64), // 간격
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: BigButton(text: 'Start Cooking', onClick: (){}),
                ),
                SizedBox(height: 84), // 간격
              ],
            ),
          ),
          /*Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0), // 좌우 패딩
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // 세로 중앙 정렬
                crossAxisAlignment: CrossAxisAlignment.center, // 가로 중앙 정렬
                children: [
                  // 요리사 모자 아이콘 (이미지에서 흰색 윤곽선)
                  Image.asset(
                    'assets/icons/chef_hat.png',
                    height: 79, // 이미지 크기 조절
                    width: 79,
                    color: AppColors.white, // 흰색으로 필터링
                  ),
                  const SizedBox(height: 20), // 간격
                  // 100K+ Premium Recipe 텍스트
                  const Text(
                    '100K+ Premium Recipe',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 80), // 간격
                  // Get Cooking 타이틀
                  const Text(
                    'Get\nCooking', // 줄바꿈
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      height: 1.2, // 줄 간격 조절
                    ),
                  ),
                  const SizedBox(height: 20), // 간격
                  // Simple way to find Tasty Recipe 텍스트
                  const Text(
                    'Simple way to find Tasty Recipe',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70, // 약간 투명한 흰색
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 80), // 간격
                  // Start Cooking 버튼
                  SizedBox(
                    width: double.infinity, // 부모 너비에 꽉 차게
                    height: 56, // 버튼 높이
                    child: ElevatedButton(
                      onPressed: () {
                        // 버튼 클릭 시 동작 (예: 다음 화면으로 이동)
                        print('Start Cooking button pressed!');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF27AE60), // 이미지의 녹색 버튼 색상
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0), // 둥근 모서리
                        ),
                        elevation: 0, // 그림자 제거
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Start Cooking',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}
