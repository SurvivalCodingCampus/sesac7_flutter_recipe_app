import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/image_search_view_model.dart';
import 'image_detail_screen.dart';

class ImageSearchScreen extends StatefulWidget {
  const ImageSearchScreen({super.key});

  @override
  State<ImageSearchScreen> createState() => _ImageSearchScreenState();
}

class _ImageSearchScreenState extends State<ImageSearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // 초기 검색어를 설정하고 검색을 시작할 수도 있습니다.
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   Provider.of<ImageSearchViewModel>(context, listen: false).searchImages('nature');
    // });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ViewModel 인스턴스를 가져옵니다. listen: true (기본값)로 설정하여 ViewModel의 변화에 따라 UI가 리빌드되도록 합니다.
    final viewModel = Provider.of<ImageSearchViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        // title: const Text('Pixabay 이미지 검색'), // 스크린샷에는 앱바 타이틀이 없음
        elevation: 0, // 앱바 그림자 제거
        toolbarHeight: 80, // 앱바 높이 조절
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 40.0, left: 16.0, right: 16.0, bottom: 8.0), // 상단 패딩 추가
          child: Container(
            height: 50, // TextField 높이 조절
            decoration: BoxDecoration(
              color: Colors.grey[200], // 검색바 배경색
              borderRadius: BorderRadius.circular(10.0), // 둥근 모서리
            ),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey[600]),
                prefixIcon: Icon(Icons.search, color: Colors.grey[600]), // 돋보기 아이콘
                suffixIcon: IconButton( // 검색 아이콘을 suffixIcon으로 사용하여 오른쪽 정렬
                  icon: const Icon(Icons.search, color: Colors.grey), // 스크린샷의 돋보기 아이콘 (테두리 없음)
                  onPressed: () {
                    viewModel.searchImages(_searchController.text);
                    FocusScope.of(context).unfocus(); // 키보드 닫기
                  },
                ),
                border: InputBorder.none, // 기본 TextField 테두리 제거
                contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0), // 텍스트 패딩
              ),
              onSubmitted: (value) {
                viewModel.searchImages(value);
                FocusScope.of(context).unfocus(); // 키보드 닫기
              },
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // 로딩 인디케이터
          if (viewModel.isLoading)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
          // 에러 메시지
          if (viewModel.errorMessage.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                viewModel.errorMessage,
                style: const TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),
            ),
          // 이미지 그리드 (Expanded로 남은 공간 채우기)
          Expanded(
            child: _buildImageGrid(viewModel),
          ),
        ],
      ),
    );
  }

  // 이미지 그리드 위젯 빌더
  Widget _buildImageGrid(ImageSearchViewModel viewModel) {
    if (viewModel.images.isEmpty && !viewModel.isLoading && viewModel.errorMessage.isEmpty) {
      // 초기 상태 또는 검색 결과 없음 (에러 메시지 없을 때)
      return const Center(child: Text('검색어를 입력하여 이미지를 찾아보세요.'));
    } else if (viewModel.images.isEmpty && !viewModel.isLoading && viewModel.errorMessage.isNotEmpty) {
      // 에러 메시지가 표시되었고 이미지가 없을 때 (에러 메시지가 이미 표시됨)
      return Container(); // 이미 에러 메시지가 표시되었으므로 추가 텍스트 불필요
    } else if (viewModel.images.isEmpty && !viewModel.isLoading) {
      // 검색 결과는 없지만 에러도 아닐 때
      return const Center(child: Text('검색 결과가 없습니다.'));
    }

    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 스크린샷과 같이 한 줄에 2개의 이미지
        crossAxisSpacing: 10.0, // 가로 간격
        mainAxisSpacing: 10.0, // 세로 간격
      ),
      itemCount: viewModel.images.length,
      itemBuilder: (context, index) {
        final image = viewModel.images[index];
        // ImageModel의 thumbnailUrl 사용 (매퍼에서 webformatURL을 매핑했음)
        final imageUrl = image.thumbnailUrl;

        return Card(
          clipBehavior: Clip.antiAlias, // 이미지가 카드 경계를 넘어가지 않도록
          elevation: 2.0, // 카드 그림자
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), // 카드 모서리 둥글게
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ImageDetailScreen(image: image),
                ),
              );
              // 이미지 탭 시 상세 보기 등 로직 추가
              // print('Image tapped: ${image.id}, Tags: ${image.tags}');
              // ScaffoldMessenger.of(context).showSnackBar(
              //   SnackBar(content: Text('Image ID: ${image.id}\nTags: ${image.tags}')),
              // );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch, // 너비를 카드에 맞춤
              children: [
                Expanded(
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover, // 이미지가 공간을 채우도록
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(Icons.broken_image, size: 40, color: Colors.grey),
                      );
                    },
                  ),
                ),
                // 이미지 정보 (선택 사항, 스크린샷에는 없음)
                // Padding(
                //   padding: const EdgeInsets.all(4.0),
                //   child: Text(
                //     image.tags,
                //     maxLines: 1,
                //     overflow: TextOverflow.ellipsis,
                //     style: const TextStyle(fontSize: 12),
                //   ),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}