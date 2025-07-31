import 'package:flutter/material.dart';
import '../../../../ui/app_colors.dart';
import '../../../../ui/text_styles.dart';

class ChefProfile extends StatelessWidget {
  final String chefName;
  final String location;
  final VoidCallback onFollowPressed;
  final bool isFollowing;

  const ChefProfile({
    super.key,
    required this.chefName,
    required this.location,
    required this.onFollowPressed,
    required this.isFollowing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          // 셰프 정보
          Expanded(
            child: Row(
              children: [
                // 프로필 이미지
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.gray4,
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 24,
                    color: AppColors.gray2,
                  ),
                ),

                const SizedBox(width: 10),

                // 셰프 정보
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        chefName,
                        style: TextStyles.smallTextBold.copyWith(
                          fontSize: 14,
                          color: AppColors.black,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 14,
                            color: AppColors.gray3,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            location,
                            style: TextStyles.smallerTextRegular.copyWith(
                              fontSize: 11,
                              color: AppColors.gray3,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 팔로우 버튼
          GestureDetector(
            onTap: onFollowPressed,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.primary100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                isFollowing ? 'Following' : 'Follow',
                style: TextStyles.smallTextBold.copyWith(
                  fontSize: 11,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
