import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/example/presentation/screen/image_search_screen.dart';
import 'package:flutter_recipe_app/01_stateless/example/presentation/view_model/image_search_view_model.dart';
import 'package:flutter_recipe_app/01_stateless/example/repository/image_repository.dart';
import 'package:flutter_recipe_app/01_stateless/example/repository/image_repository_impl.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'data_source/image_data_source.dart';
import 'data_source/image_data_source_impl.dart';

void main() {
  // 의존성 주입 (Dependency Injection) 설정
  // 실제 앱에서는 GetIt, Riverpod 등의 DI 컨테이너를 사용하는 것이 더 체계적입니다.
  final http.Client httpClient = http.Client();
  final ImageDataSource imageDataSource = ImageDataSourceImpl(client: httpClient);
  final ImageRepository imageRepository = ImageRepositoryImpl(dataSource: imageDataSource);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ImageSearchViewModel(repository: imageRepository),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pixabay 이미지 검색',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          color: Colors.white, // 상단 앱바 배경색을 흰색으로
          iconTheme: IconThemeData(color: Colors.black), // 아이콘 색상 검정
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold), // 타이틀 색상 검정
        ),
        scaffoldBackgroundColor: Colors.white, // 전체 배경색 흰색
      ),
      home: const ImageSearchScreen(),
    );
  }
}