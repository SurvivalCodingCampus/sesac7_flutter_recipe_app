## 상태 없는 Widget 작성 규칙
---
- 좋은 UI 코드란 테스트가 가능한 UI코드를 얘기한다.
- 데이터의 흐름
	- 대부분의 Widget은 Stateless 상태이다.(getter, setter를 노출하지 않음)
	- 생성자를 통해서 UI 데이터를 전달받는다.
- 이벤트의 흐름
	- 작은 컴포넌트 내에서 화면이동, 데이터 변경 등 상태변경 행위를 금지한다.
- 규칙
	1. 컴포넌트는 가능한한 Stateless를 유지한다.
		- 생성자를 통해서 데이터를 전달받느데 가능하면 불변의 모델 데이터를 전달 받는다.
	2. StatelessWidget 내부에서 앱의 상태를 변경하지 않는다.
		- 콜백 함수를 통해서 상위 위젯으로 전달하고 상위 위젯의 로직을 실행한다.
		- 앱의 상태가 변경되면, UI가 업데이트 된다.
		- GestureDetector의 onTap등 제스쳐 함수내에서 화면이동, 데이터 변경 등 상태 변경 행위 금지
	3. 유저 인터랙션으로 상태 변경이 필요할 때는 콜백함수를 통해서 외부에 노출한다.
		- nullable의 콜백함수면 call()을 사용해서 명시적으로 호출해준다.
- UI Test
	- Widget Test는 testWidgets()를 사용한다.
	- 기본적으로 비동기 함수를 사용한다. (pumpWidget이 비동기)
	- pumpWidget()을 사용하여 앱을 실행 ==> runApp()과 동일
	- pump(Duration?)을 사용하면 지정된 시간 후에 다시 그리기 ==> setState() 효과
	- pumpAndSettle() 애니메이션이 끝날 때 까지 pump()를 반복한다.
	- find는 CommonFinder를 사용하는 top-level 함수 이걸 쓰면 편하게 위젯을 찾을 수 있다.
	- expect에서 findOneWidget을 사용하면 1개의 위젯을 찾았는지 확인가능
	- Material을 쓰는 Widget을 테스트하려면 MaterialApp으로 감싸서 해야한다.
	- 모든 Widget은 key를 가지고 있는데 특정 key를 가지는 위젯을 찾을 수 있다.
		- Test 환경에서는 key를 지정하면 찾기가 보다 수월하다.
		- const를 쓰지 않으면 runtime에서 다른 인스턴스가 되서 붙여서 사용한다.