# RESTful API

## RESTful api 왜 만드는가?

현대 서비스는 범용적인 사용이 필요하다. 
각종 브라우저 및 아이폰 안드로이드 애플리케이션과의 통신에 맞춰서 개발을 해야 하는데 그 때 마다 서버를 개발하는 것은 비 효율적이기 때문에 범용적인 사용성을 보장하는 서버 디자인이 필요하다.
이러한 여러 통신을 포용할 수 있는 `Hypermedia API`의 개발을 위해서 `RESTful API`가 사용된다.

## REST란?

REST 는 `Representational state transfer`의 약자로서 www( world wide web ) 과 같은 하이퍼 미디어에 시스템에서 운영되는 소프트웨어 아키텍쳐 스타일이다.

HTTP 1.1 버전과 동시에 나오게 되었는데 이는 HTTP 프로토콜을 정확한 의도에 맞춰 디자인 할 수 있도록 도와주며 의미적인 범용성을 지니므로 중간계층 컴포넌트들이 서비스를 최적화 하는데 도움을 준다.

무엇보다 이렇게 잘 디자인된 RESTful api 는 여러 플랫폼을 보다 유연하게 지원할 수 있으며 , api로서 공개되어야 할 때도 설명이 간결해진다.

따라서 RESTful api 는 최근에 모바일 웹 서비스를 지원하는 아키텍쳐로서 중요하다고 할 수 있다.

## 중심 규칙

REST 에서 가장 중요한 두가지 규칙은 이것이다.
- URI는 정보의 자원을 표현해야 한다.
- 자원에 대한 행위는 HTTP Method(GET, POST, PUT, DELETE 등)으로 표현한다. 

자원은 크게 두가지로 나눌 수 있는데 이는 `Collection` 과 `Element` 이다. 이 개념을 익혀두고 아래 테이블을 참고 한다면 대부분의 통신을 표현할 수 있다.

### `Collection` URI , such as `http://ex.com/resources`

|GET|PUT|POST|DELETE|
|:--:|:--:|:--:|:--:|
| 컬렉션에 속한 자원들의 URI나 상세 정보를 보여준다.|컬렉션의 전체를 다른 컬렉션으로 수정한다.|컬렉션에 해당하는 새로운 자원을 생성해서 입력한다.|전체 컬렉션을 삭제한다.|


### `Element` URI , such as `http://ex.com/resources/item14`

|GET|PUT|POST|DELETE|
|:--:|:--:|:--:|:--:|
|요청한 컬렉션 내 자원을 반환한다.|해당 자원을 수정한다.|해당 자원에 귀속되는 새로운 자원을 생성한다.|해당 컬렉션 내 자원을 삭제한다.|

### PATCH

최근에는 `PATCH` HTTP Method 가 주목받고 있다. `PUT` Method 는 해당 자원 전체를 수정한다는 뜻이므로, update event의 경우 `PATCH` Method 가 의미적으로 더 적절하다는 말이 나오고 있다.

### Ex
특정 사용자의 정보를 받으려고 할때 RESTful 하게 디자인 한다면 아래의 예시를 살펴보자

```java
    
    1. GET "/users/show/1" 

    2. GET "/users/1" 

```

위의 예시를 살펴본다면 1번 코드에서 show라는 행위는 uri 에 표한하는 것은 restful에 적합하지 않다. 본다는 것은 HTTP Method의 GET 으로 충분하게 표현할 수 있기 때문이다.

따라서 2번 코드와 같이 users 라는 모델에 GET Method 를 사용하겠다 라는 표현을 하는 것이 조금 더 바람직 하다고 볼 수 있다.

## 입력 Form 은 어떻게 받아오게 할 것인가?

입력 form을 하나의 정보로서 생각하면 된다. 아래는 rails 의 기본 CRUD REST API 이다.

|Http Verb|Path|action|used for|
|:--|:--|:--|:--|
| GET | /photos | index | display a list of all photos |
| GET | /photos/new | new | return an html form to creating a new photo |
| POST | /photos | create | create a new photo |
| GET | /photos/:P_id | show | display a specific photo | 
| GET | /photos/:P_id/edit | edit | return an HTML form for editing a photo |
| PUT | /photos/:P_id | update | update a specific photo |
| DELETE | /photos/:P_id | destroy | delete a specific photo |


## 모바일 환경에 따라 다른 정보를 보여줘야 한다면?

REST 하게 만든다면 서버는 플랫폼 중립적이어야 하며 정보를 보여줄 때 여러 플랫폼을 구분해야 한다면 , 사용자가 어떤 플랫폼을 사용하는지 알아야 한다. 이를 위해서는 `Request Header`의 `User-Agent` 값을 체크하는것이 좋다.

```java
Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420+ (KHTML, like Gecko) Version/3.0 Mobile/1A543a Safari/419.3
```

대부분의 OS 나 플랫폼은 요청을 보낼 때 User-Agent에 상세하게 정보를 담아서 보내기 때문에 이 값을 체크한다면 사용자의 플랫폼을 확인할 수 있다.


## 버전과 정보 포맷을 지정할 수 있게 해야 한다면?

서버가 버전 협상을 지원한다면 최신 버전으로 업데이트가 되더라도 구 버전의 정보 요청에 하위 호환하게 하여 서비스 적용범위를 넓게 유지할 수 있습니다. 

이와 함께 클라이언트가 html로 정보를 받을지, json으로 받을지, xml로 받을지 선택할 수 있다면 더욱 좋을 것입니다.

Header의 Accept 헤더를 통해서 요청 환경에서 정보의 버전과 포맷을 지정할 수 있다.
```java 
application/vnd.github+json
```
`vnd` 는 Vendor MIME Type으로, 서비스 개발자가 자신의 독자적인 포맷을 규정할 수 있게 HTTP 표준에서 제공하는 접두어이다. vnd. 이후에 서비스 제공자 이름을 쓴 후, +로 문서의 기본 포맷을 표현해주면 된다.

이에 더해 Accept 헤더는 파라미터를 지정해 줄 수 있는데, 이를 통해서 버전에 대한 정보를 포함시킨다.

```
vnd.example-com.foo+json; version=1.0 
```

## 언어

언어별로 다른 API 를 제공하는 것은 매우 좋지 않은 설계이다. 

사용자의 언어는 Request Header 의 `Accept-language` 를 통해서 확인할 수 있다. 대부분의 OS 와 브라우저는 사용자가 자주 쓰는 언어에 대해서 이 값을 저장해 놓은 뒤 요청을 보낸다. 따라서 이 헤더값을 확인한 뒤 해당하는 언어를 사용한 정보를 보여주는 것을 통해 정확한 서비스를 구현할 수 있다.

## 마치며 

REST가 완전한 정답은 아니다. 구형 브라우저에서 완전하게 포함시키지 못한 이유도 있고, 테스트가 많은 경우에 Method를 다양화 시킨다면 오히려 생산성이 떨어질 수도 있기 때문이다.

또한 널리 쓰여야 하는 API의 경우에는 많은 개발자들이 `Method`와 `URI` 의 조합을 더욱 어렵다고 생각할 수도 있을 것이다. 실제로 구글에서도 완벽하게 REST API를 따르고 있지는 않다고 한다.

REST로 한다고 좋은 API는 아니며 REST 가 아니라고 나쁜 API 는 더더욱 아니다. 하지만 현재 사용되는 서비스의 대부분은 REST 를 얼마만큼 충실하게 반영할 것인지를 고민하는데 , 이는 결국 REST 가 기본 Base 가 된다는 뜻이므로 REST를 제대로 익힌다면, 현재의 개발 상황에 맞춘 API 를 설계하는데 많은 도움이 될 것이다.



참고

[스포카 REST 아키텍처 적용 팁](https://spoqa.github.io/2012/02/27/rest-introduction.html)

[스포카 REST 설계 팁](https://spoqa.github.io/2013/06/11/more-restful-interface.html)