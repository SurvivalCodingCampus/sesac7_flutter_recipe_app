## MVVM 패턴
Model-View-ViewModel
- Model
	- 데이터와 관련된 비즈니스 로직
	- 주로 Repository 이하의 계층
- ViewModel
	- 화면에 대한 비즈니스 로직
	- View에서 해야할 동작들을 정의한다.
	- 데이터가 변경되면 View에 알린다.
	- 화면 하나에 한 개의 ViewModel을 가지는 1:1 관계
- View
	- UI 화면
	- ViewModel에 의해서 갱신된 데이터를 자동으로 화면의 UI 반영
### MVVM의 Repository 패턴 적용
- Repository를 사용하지 않아도 되지만 ViewModel이 비대해지기 때문에 테스트에 용의하지 않다.
### Flutter의 Observing 
- ChangeNotifier를 사용해서 관찰한다.
