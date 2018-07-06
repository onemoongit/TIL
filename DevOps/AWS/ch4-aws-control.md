# AWS
## Control

AWS의 인프라를 제어하는 방법들

### Console

AWS 홈페이지에서 GUI 형식인 management console을 사용하는 것

- 장점 : 익숙하다 , 편하다

- 단점 : 연속적인 작업을 하기 어렵다.

### CLI ( Command Line Interface )

컴퓨터에서 Console을 통해서 직접 명령을 입력하는 것

- 장점 : GUI 보다 편리하게 시스템을 제어할 수 있다 , 일련의 연속적인 작업을 실행하기 쉽다. (예를 들어 구조적인 상태에서 하단으로 들어갈 때)

- 단점 : 어떤 명령어가 있는지 , 어떤 문법이 있는지 알아야 한다.

### SDK ( Softwear Development Kit )

프로그래밍 언어를 통해서 명령이 실행되는 순서를 설정해줄 수 있다.

명령어의 세트가 제공이 된다.

- 장점 : 더 섬세하게 , 지능적으로 설정이 가능하다.

- 단점 : CLI와 마찬가지로 명령어와 문법을 알아야 한다.

### API ( Application Programming Interface )

RESTful API 로서 web에서 조금 더 쉽게 처리할 수 있도록 하는 기능

- 장점 : 가장 자유도가 높고 , 특정한 프로그래밍 언어를 가리지 않는다.

- 단점 : 직접 이해하는 것이 상당히 어렵다.





따라서 API를 통해서 SDK를 만들어서 AWS가 제공한다고 생각하면 된다.
