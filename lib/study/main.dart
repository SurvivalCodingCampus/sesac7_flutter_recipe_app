import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:get_it/get_it.dart';
import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main.freezed.dart';

part 'main.g.dart';

// --- DI 설정: GetIt 인스턴스 생성 ---
final getIt = GetIt.instance;

// --- 유틸리티: Result 클래스 ---
@freezed
sealed class Result<T> with _$Result<T> {
  const factory Result.success(T data) = Success;

  const factory Result.error(Exception e) = Error;
}

// --- 1. 데이터 계층 ---
@JsonSerializable()
class ItemDto {
  final int? id;
  final String? title;

  ItemDto({this.id, this.title});

  factory ItemDto.fromJson(Map<String, dynamic> json) =>
      _$ItemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ItemDtoToJson(this);
}

class ItemDataSource {
  Future<List<ItemDto>> getDtos() async {
    await Future.delayed(const Duration(seconds: 1));
    final jsonString =
        '[${List.generate(10, (i) => '{"id": ${i + 1}, "title": "아이템 ${i + 1}"}').join(',')}]';
    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((json) => ItemDto.fromJson(json)).toList();
  }
}

// --- 2. 도메인 계층 ---
class Item {
  final int id;
  final String name;

  Item({required this.id, required this.name});
}

class ItemMapper {
  static Item fromDto(ItemDto dto) =>
      Item(id: dto.id ?? 0, name: dto.title ?? '이름 없음');
}

class ItemRepository {
  final ItemDataSource _dataSource;

  ItemRepository(this._dataSource);

  Future<Result<List<Item>>> getItems() async {
    try {
      final dtos = await _dataSource.getDtos();
      return Result.success(
        dtos.map((dto) => ItemMapper.fromDto(dto)).toList(),
      );
    } catch (e) {
      return Result.error(Exception('데이터 로드 실패: $e'));
    }
  }
}

class GetItemsUseCase {
  final ItemRepository _repository;

  GetItemsUseCase(this._repository);

  Future<Result<List<Item>>> execute() => _repository.getItems();
}

// --- 3. 프레젠테이션 계층 (ViewModel & UI State) ---
@freezed
abstract class ItemsState with _$ItemsState {
  const factory ItemsState({
    @Default([]) List<Item> items,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _ItemsState;
}

class ItemsViewModel with ChangeNotifier {
  final GetItemsUseCase _getItemsUseCase;

  ItemsViewModel(this._getItemsUseCase);

  ItemsState _state = const ItemsState();

  ItemsState get state => _state;

  Future<void> fetchItems() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final result = await _getItemsUseCase.execute();
    switch (result) {
      case Success<List<Item>>(:final data):
        _state = state.copyWith(isLoading: false, items: data);
      case Error(:final e):
        _state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
    notifyListeners();
  }
}

// --- DI 설정 함수 ---
void setupDependencies() {
  getIt.registerSingleton<ItemDataSource>(ItemDataSource());
  getIt.registerSingleton<ItemRepository>(
    ItemRepository(getIt<ItemDataSource>()),
  );
  getIt.registerSingleton<GetItemsUseCase>(
    GetItemsUseCase(getIt<ItemRepository>()),
  );
  getIt.registerFactory<ItemsViewModel>(
    () => ItemsViewModel(getIt<GetItemsUseCase>()),
  );
}

// --- 4. 라우터 설정 ---
final _router = GoRouter(
  initialLocation: '/items',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          MainScreen(shell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/items',
              builder: (context, state) {
                // 라우터가 ViewModel을 생성하여 View에 주입
                final viewModel = getIt<ItemsViewModel>();
                viewModel.fetchItems(); // 데이터 로드 시작
                return ItemsScreen(viewModel: viewModel);
              },
              routes: [
                GoRoute(
                  path: 'detail/:id',
                  builder: (context, state) =>
                      ItemDetailScreen(id: state.pathParameters['id']!),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/settings',
              builder: (context, state) => const SettingsScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => ErrorScreen(error: state.error),
);

// --- App Entry Point ---
void main() {
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) =>
      MaterialApp.router(routerConfig: _router);
}

// --- 5. 뷰 계층 ---
class MainScreen extends StatelessWidget {
  final StatefulNavigationShell shell;

  const MainScreen({super.key, required this.shell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: shell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: shell.currentIndex,
        onDestinationSelected: (index) => shell.goBranch(index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.list), label: '아이템'),
          NavigationDestination(icon: Icon(Icons.settings), label: '설정'),
        ],
      ),
    );
  }
}

// StatelessWidget으로 변경
class ItemsScreen extends StatelessWidget {
  final ItemsViewModel viewModel;

  const ItemsScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('아이템 목록')),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) {
          final state = viewModel.state;
          if (state.isLoading)
            return const Center(child: CircularProgressIndicator());
          if (state.errorMessage != null)
            return Center(child: Text(state.errorMessage!));

          return ListView.builder(
            itemCount: state.items.length,
            itemBuilder: (context, index) {
              final item = state.items[index];
              return ListTile(
                title: Text(item.name),
                onTap: () {
                  context.go('/items/detail/${item.id}');
                },
              );
            },
          );
        },
      ),
    );
  }
}

class ItemDetailScreen extends StatelessWidget {
  final String id;

  const ItemDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('아이템 상세')),
      body: Center(child: Text('선택된 아이템 ID: $id')),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('설정')),
      body: const Center(
        child: Text('설정 화면입니다.'),
      ),
    );
  }
}

class ErrorScreen extends StatelessWidget {
  final Exception? error;

  const ErrorScreen({super.key, this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('에러')),
      body: Center(
        child: Text(error?.toString() ?? '페이지를 찾을 수 없습니다.'),
      ),
    );
  }
}

/*
--- pubspec.yaml 파일 내용 ---

name: flutter_architecture_skeleton
description: "A new Flutter project."
publish_to: 'none'
version: 1.0.0+1

environment:
  sdk: '>=3.2.0 <4.0.0'

#==============================================================================
# Dependencies: 앱 실행에 직접 필요한 패키지들
#==============================================================================
dependencies:
  flutter:
    sdk: flutter

  # --- 상태 관리 및 아키텍처 ---
  get_it: ^7.7.0 # 의존성 주입(DI)을 쉽게 관리하기 위해 사용

  # --- 라우팅 ---
  go_router: ^14.2.0 # 화면 간의 이동(네비게이션)을 관리

  # --- 네트워크 통신 ---
  http: ^1.2.1 # 서버와 HTTP 통신(API 호출)을 위해 사용

  # --- 코드 생성 (Annotation) ---
  # build_runner가 코드를 생성할 때 참고하는 어노테이션
  freezed_annotation: ^2.4.1 # 불변(immutable) 클래스와 sealed class를 쉽게 만들기 위해 사용
  json_annotation: ^4.9.0 # JSON 직렬화/역직렬화를 위한 어노테이션

  # --- UI 및 유틸리티 ---
  cupertino_icons: ^1.0.8 # iOS 스타일 아이콘

#==============================================================================
# Dev Dependencies: 개발 과정에서만 필요한 패키지들
#==============================================================================
dev_dependencies:
  flutter_test:
    sdk: flutter

  # --- 코드 생성 (Generator) ---
  # 터미널에서 `flutter pub run build_runner build` 명령으로 코드를 자동 생성
  build_runner: ^2.4.11 # 파일 감지 및 코드 생성을 실행하는 도구
  freezed: ^2.5.2 # freezed_annotation을 기반으로 실제 코드를 생성
  json_serializable: ^6.8.0 # json_serializable을 기반으로 fromJson/toJson 코드를 생성

  # --- 코드 분석 및 테스트 ---
  flutter_lints: ^4.0.0 # 코드 스타일과 잠재적 오류를 검사하는 규칙 모음

#==============================================================================
# Flutter 관련 설정
#==============================================================================
flutter:
  uses-material-design: true

#==============================================================================
# 터미널에 복사 & 붙여넣기 하여 모든 패키지를 한 번에 추가할 수 있습니다.
#==============================================================================
# flutter pub add get_it go_router http freezed_annotation json_annotation cupertino_icons
# flutter pub add dev:build_runner dev:freezed dev:json_serializable dev:flutter_lints

*/
