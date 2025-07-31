# 테스트 목표
- coverage 80 이상.

# 유닛 테스트
## 1. 테스트 대상 정의 (Define the Target)
- 클래스: [테스트하려는 클래스 이름] (예: UserRepositoryImpl)
- 메서드 / 함수: [테스트하려는 메서드 이름] (예: Future<User> getUser(String userId))

## 2. 테스트 시나리오 설계 (Design Test Scenarios)
### A. 성공 케이스 (Happy Path)
- 조건: 정상적인 입력값이 주어졌을 때
  - 입력값 예시: userId = 'abc-123'
- 기대 결과: 이 메서드는 무엇을 반환해야 하는가?
  - 기대 결과 예시: 정상적으로 User 객체를 반환해야 한다.
- 의존성 동작: 이 과정에서 호출되어야 하는 외부 의존성(다른 클래스, 메서드)은 무엇이며, 몇 번 호출되어야 하는가?
  - 의존성 예시: userRemoteDatasource.getUser(userId)가 정확히 1번 호출되어야 한다.

### B. 실패 케이스 (Failure Cases)
- 조건 1: 의존성에서 예외가 발생했을 때 (네트워크 오류, DB 오류 등)
- 발생 예외: userRemoteDatasource.getUser(userId)가 NetworkException을 던졌을 때
- 기대 결과: 이 메서드는 어떤 종류의 예외를 다시 던지거나 어떻게 처리해야 하는가?
  - 기대 결과 예시: UserRepositoryException 타입의 예외를 던져야 한다.

- 조건 2: 데이터 처리 중 예외가 발생했을 때 (파싱 오류 등)
- 발생 예외: userRemoteDatasource가 반환한 데이터의 형식이 잘못되어 FormatException이 발생했을 때
- 기대 결과: 어떻게 처리해야 하는가?
  - 기대 결과 예시: InvalidDataException을 던져야 한다.

### C. 엣지 케이스 (Edge Cases)
- 조건 1: 입력값이 비정상적일 때 (null, 빈 값 등)
  - 입력값 예시: userId가 빈 문자열('')일 때
- 기대 결과: 어떻게 동작해야 하는가?
  - 기대 결과 예시: ArgumentError를 던지거나, 즉시 null을 반환해야 한다.

- 조건 2: 반환된 데이터가 비어있을 때
- 의존성 동작: userRemoteDatasource가 null 또는 빈 데이터를 반환했을 때
- 기대 결과: 어떻게 동작해야 하는가?
  - 기대 결과 예시: NotFoundException을 던져야 한다.

## 3. 테스트 코드 작성
각 시나리오에 대해 아래 구조로 테스트 코드를 작성합니다.

```Dart
test('[시나리오 설명(영어로 작성)]', () async {
  // Given (준비): 테스트 환경 설정
  // 1. Mock 객체의 행동 정의 (when ... thenReturn / thenAnswer / thenThrow)
  // 예: when(() => mockDatasource.getUser(any())).thenAnswer((_) async => mockUserDto);

  // When (실행): 테스트 대상 메서드 호출
  // 예: final result = repository.getUser('abc-123');

  // Then (검증): 결과 확인
  // 1. 반환 값 검증 (expect)
  // 예: expect(result, isA<User>());
  // 2. 예외 발생 검증 (expect(... throwsA(...)))
  // 예: expect(() => repository.getUser(''), throwsA(isA<ArgumentError>()));
  // 3. 의존성 메서드 호출 여부 검증 (verify)
  // 예: verify(() => mockDatasource.getUser('abc-123')).called(1);
  // 4. 의존성 메서드 미호출 여부 검증 (verifyNever)
  // 예: verifyNever(() => mockLocalDatasource.getUser(any()));
});
```

# 위젯 테스트
## 1. 테스트 대상 위젯 정의 (Define the Widget Under Test)
- 위젯: [테스트하려는 위젯 이름] (예: LoginScreen, UserProfileCard)
- 목적: 이 위젯의 핵심적인 역할은 무엇인가?
  - 예시: 사용자의 이메일과 비밀번호를 입력받아 로그인을 시도한다.

## 2. 테스트 시나리오 설계 (Design Test Scenarios)
### A. 초기 상태 렌더링 (Initial State Rendering)
- 조건: 위젯에 초기 데이터나 특정 상태가 주어졌을 때
  - 예시: ViewModel이 로딩 상태일 때, ViewModel이 데이터를 성공적으로 받아왔을 때
- 기대 UI: 화면에 어떤 위젯들이 보여야 하는가? 특정 텍스트나 이미지가 올바르게 표시되는가?
  - 예시: 로딩 상태일 때 CircularProgressIndicator가 보여야 한다.
  - 예시: 데이터가 있을 때 사용자의 이름('Alice')과 이메일 텍스트가 표시되어야 한다.
  - 예시: 특정 버튼('수정하기')이 화면에 존재해야 한다 (findsOneWidget).

### B. 사용자 상호작용 (User Interaction)
- 조건: 사용자가 특정 액션을 취했을 때
  - 예시: '로그인' 버튼을 탭(tap)했을 때
  - 예시: TextFormField에 텍스트를 입력(enterText)했을 때
  - 예시: 리스트를 스크롤(drag)했을 때
- 기대 동작: 어떤 일이 발생해야 하는가? 어떤 콜백 함수나 ViewModel의 메서드가 호출되어야 하는가?
  - 예시: authViewModel.login() 메서드가 정확히 1번 호출되어야 한다.
  - 예시: onTap 콜백 함수가 실행되어야 한다.
  - 예시: 다른 화면으로 이동(navigate)해야 한다.

### C. 상태 변화에 따른 UI 업데이트 (UI Update on State Change)
- 조건: 외부 상태(Provider, ViewModel 등)가 변경되었을 때
  - 예시: ViewModel의 상태가 loading에서 success로 변경되었을 때
- 기대 UI: 위젯이 어떻게 다시 그려져야 하는가?
  - 예시: CircularProgressIndicator가 사라지고 ListView가 나타나야 한다.
  - 예시: 버튼이 비활성화 상태에서 활성화 상태로 변경되어야 한다.

## 3. 테스트 코드 작성 (AAA 패턴: Arrange, Act, Assert)
각 시나리오에 대해 아래 구조로 테스트 코드를 작성합니다.

```Dart
testWidgets('[시나리오 설명(영어로 작성)]', (WidgetTester tester) async {
  // Given (준비): 테스트 환경 설정
  // 1. 테스트에 필요한 Mock 객체나 Fake 데이터 생성
  // 예: final mockAuthViewModel = MockAuthViewModel();
  // 2. Mock 객체의 초기 상태나 메서드 반환 값 설정 (when ... thenReturn)
  // 예: when(() => mockAuthViewModel.isLoggedIn).thenReturn(true);
  // 3. ProviderScope나 MaterialApp 등으로 테스트 위젯을 감싸서 렌더링 (tester.pumpWidget)
  //    - 의존성 주입(Provider overrides)은 이 단계에서 수행
  // 예: await tester.pumpWidget(ProviderScope(
  //       overrides: [authViewModelProvider.overrideWith((ref) => mockAuthViewModel)],
  //       child: const MaterialApp(home: MyWidget()),
  //     ));

  // When (실행): 사용자 상호작용 또는 상태 변경 시뮬레이션
  // 예: await tester.tap(find.byType(ElevatedButton));
  // 예: await tester.enterText(find.byKey(const Key('email_field')), 'test@test.com');
  // 상태 변경 후 UI를 업데이트하기 위해 tester.pump() 또는 tester.pumpAndSettle() 호출
  // 예: await tester.pump();

  // Then (검증): 결과 확인
  // 1. 특정 위젯이나 텍스트가 화면에 있는지/없는지 확인 (find ... findsOneWidget / findsNothing)
  // 예: expect(find.text('Welcome!'), findsOneWidget);
  // 예: expect(find.byType(CircularProgressIndicator), findsNothing);
  // 2. Mock 객체의 메서드가 올바르게 호출되었는지 확인 (verify)
  // 예: verify(() => mockAuthViewModel.login()).called(1);
});
```

# 인테그레이션 테스트
## 1. 테스트할 사용자 시나리오/기능 (Define the User Scenario)
- 시나리오: [테스트하려는 사용자 여정(user journey)을 한 문장으로 설명]
  - 예시: 사용자가 이메일과 비밀번호를 입력하고 로그인 버튼을 눌러 홈 화면으로 성공적으로 이동한다.
- 테스트 목표: 이 테스트를 통해 구체적으로 무엇을 검증하고 싶은가?
  - 예시: 로그인 과정에서 UI, ViewModel, Repository가 올바르게 함께 동작하는지 검증한다.

## 2. 테스트 범위 및 경계 (Define Scope and Boundaries)
- 실제 구현 사용: 시나리오와 관련된 어떤 부분(UI, ViewModel, Repository 등)의 실제 구현을 사용할 것인가?
  - 예시: LoginScreen, AuthViewModel, AuthRepositoryImpl의 실제 구현을 모두 사용한다.
- Mocking 대상: 어떤 외부 의존성을 Mocking할 것인가? (테스트의 안정성과 속도를 위해)
  - 예시: AuthRepositoryImpl이 사용하는 외부 네트워크 클라이언트(ApiClient)를 Mocking한다.
  - 예시: Firebase Auth, 로컬 DB(Isar, Hive) 등

## 3. 사전 조건 (Given)
- Mock 객체 설정:
  - 조건: 테스트 시작 전, Mocking된 의존성은 어떤 상태를 반환해야 하는가?
    - 예시 (성공): when(() => mockApiClient.login(...))가 호출되면, 성공 응답(200 OK)과 함께 가짜 사용자 데이터를 반환하도록 설정한다.
    - 예시 (실패): when(() => mockApiClient.login(...))가 호출되면, NetworkException을 던지도록 설정한다.

- 앱 초기 상태:
  - 의존성 주입: ProviderScope 또는 ProviderContainer의 overrides를 사용하여 Mock 객체를 실제 의존성 대신 주입한다.
  - 앱 실행: tester.pumpWidget(const MyApp())을 통해 어떤 위젯에서 테스트를 시작할 것인가? (보통 앱의 루트 위젯)

## 4. 사용자 행동 (When)
- 행동 순서: 사용자의 행동을 순서대로 구체적으로 작성한다. 각 행동 후에는 pump() 또는 pumpAndSettle()을 호출하여 UI 변경 및 비동기 작업 완료를 기다려야 한다.
  - 예시:
    a. '이메일' TextFormField를 찾는다 (find.byKey(...)).
    b. tester.enterText()로 이메일을 입력한다.
    c. '비밀번호' TextFormField를 찾는다.
    d. tester.enterText()로 비밀번호를 입력한다.
    e. '로그인' ElevatedButton을 찾는다.
    f. tester.tap()으로 버튼을 누른다.
    g. tester.pumpAndSettle()을 호출하여 로딩 인디케이터가 사라지고 화면 전환이 완료될 때까지 기다린다.

## 5. 기대 결과 (Then)
- UI 상태 검증:
  - 조건: 모든 행동이 끝난 후, 최종적으로 화면은 어떤 상태여야 하는가?
    - 예시 (성공): 홈 화면의 '환영합니다, [사용자 이름]!' 텍스트가 보여야 한다 (findsOneWidget).
    - 예시 (실패): 로그인 화면에 '이메일 또는 비밀번호가 잘못되었습니다.'라는 에러 메시지가 보여야 한다.

- Mock 객체 호출 검증:
  - 조건: Mocking된 의존성의 메서드가 올바른 인자와 함께 예상된 횟수만큼 호출되었는가? (verify)
  - 예시: verify(() => mockApiClient.login(email: 'test@test.com', ...))가 정확히 1번 호출되었는지 확인한다.

## 통합 테스트 코드 예시 (로그인 성공 시나리오)
- description은 영어로 작성.
```Dart
// integration_test/login_flow_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ... (main.dart의 MyApp, Mock 객체, Provider 등 import)

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  
  late MockApiClient mockApiClient;
  
  setUp(() {
    //  Mock 객체 초기화
    mockApiClient = MockApiClient();
  });

  testWidgets('로그인 성공 시 홈 화면으로 이동해야 한다', (tester) async {
    // Given: 시나리오에 맞는 Mock 객체 동작 설정
    when(mockApiClient.login('test@test.com', 'password'))
        .thenAnswer((_) async => {'token': 'fake_token', 'userName': 'TestUser'});

    // ProviderScope로 Mock 객체 주입 및 앱 실행
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          apiClientProvider.overrideWithValue(mockApiClient),
        ],
        child: const MyApp(), // 실제 앱의 루트 위젯
      ),
    );
    await tester.pumpAndSettle(); // 초기 로딩 대기

    // When: 사용자 행동 시뮬레이션
    await tester.enterText(find.byKey(const Key('email_field')), 'test@test.com');
    await tester.enterText(find.byKey(const Key('password_field')), 'password');
    await tester.tap(find.byKey(const Key('login_button')));
    await tester.pumpAndSettle(); // 로그인 API 호출 및 화면 전환 대기

    // Then: 결과 검증
    // 1. UI 상태 검증: 홈 화면의 환영 메시지가 보이는지
    expect(find.text('환영합니다, TestUser!'), findsOneWidget);
    // 2. Mock 객체 호출 검증: login 메서드가 올바른 인자로 호출되었는지
    verify(mockApiClient.login('test@test.com', 'password')).called(1);
  });
}
```