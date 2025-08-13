import 'package:flutter/material.dart';

import 'core/routing/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router( // 앱의 시작점 : MaterialApp.router를 사용하게 되면 플러터의 내비게이션 시스템을 사용하는대신 직접 만든 라우터를 사용
      routerConfig: router, // routerConfig라는 설정 항목에 router라는 이름의 GoRouter 객체를 할당 즉 router규칙에 의해 이동
    );
  }
}
