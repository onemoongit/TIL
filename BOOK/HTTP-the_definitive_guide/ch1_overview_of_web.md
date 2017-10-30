# ch 1 HTTP 개관

<br>

## http(HyperText Transfer Protocol)

클라이언트와 서버사이를 http 요청과 응답을 통해 통신한다 . 이때 http클라이언트와 http서버는 www(world wide web)의 기본요소이다.

## 미디어타입

htt는 웹에서 전송되는 모든 객체에 <code>MIME</code> 타입 이라는 데이터 포멧 라벨을 붙이는데, 이를 통해서 웹 브라우저는 자신이 지원하는 객체 타입인지 아닌지를 판단하고 , 필요하다면 플러그인을 설치하는 방식으로 작동한다. 

- MIME 타입
  - 주로 header 쪽에 <code>Content-type</code> 으로 명시되어 있으며
  - <code>MIME</code> 타입은 사선을 통해서 주타입과 부타입으로 나뉘어진다.
  - (primary object type) / (specific subtype)
  - ex ) HTML -> text/html |  JPEG -> image/jpeg

## 통합자원식별자 URI (uniform resource identifier) 

`URI`는 흔히 알고있는 <code>URL(uniform resource link)</code>와 아직 정식 채택되지 않은 <code>URN(uniform resource name)</code> 두가지가 있다.

한 리소스에 대한 URI가 HTTP 프로토콜에 의해서 어떻게 해석되어지는지 보여주는것이 URI라고 한다. 

<code>URL</code>은 리소스 식별자의 가장 흔한 형태로 특정 서버의 한 리소스에 대한 구체적인 위치를 서술한다. 예를들어서 `http://helloworld.com/my-icon.jpg` 일때 세가지로 나눌수 있다. 

1. http부분을 <code>scheme(스킴)</code>이라고 한다. scehme은 리소스에 접근하기 위해 사용되는 프로토콜을 얘기한다.
2. (www.)helloworld.com 부분은 서버의 인터넷 주소이다. 이 주소는 실제로 ip지만 우리가 보기 편하게끔 이름을 지정해 놓은 것이라고 생각하면 된다.
3. /my-icon.jpg 웹 서버의 리소스 위치를 가리킨다.

<code>URN</code>은 어떤 리소스에 대해서 그 리소스의 위치에 영향을 받지 않는 유일무이한 이름 역할을 하는데 , 따라서 이 리소스를 어디로 옮기더라도 동일한 리소스가 응답된다. 예를 들어서 urn:ietf:rfc:2141 은 인터넷 표준 문서 'rfc 2141' 을 뜻하고 어디에 있거나 상관없이 동일한 리소스를 가져온다.

URN은 아직 실험중인 상태고 널리 채택되지 않았지만 나중에는 인터넷에서 없으면 안될 존재가 될지도 모른다.

## 트랜잭션 (요청명령 + 응답결과)

<code>트랜잭션</code>은 HTTP 메세지라는 정형화된 데이터 덩어리를 통해 이루어진다.

- 메서드
  - 모든 http 요청은 1개의 메서드를 가지며 서버에게 어떤 동작이 취해져야 하는지 말해준다. (GET PUT DELETE POST HEAD)
- 상태코드
  - 모든 http 응답 메세지는 상태 코드 + 사유구절과 함께 반환된다.
  - 200 OK , 404 Not Found
- 메세지
  - 총 3가지의 부분으로 나뉜다.
  1. 시작줄 : 요청이라면 무엇을 해야하는지 , 응답이라면 무슨일이 일어났는지 명시된다.
  2. 헤더  : 0개 이상의 헤더필드 , 이름 : 값으로 이루어지고, 마지막은 빈줄이다.
  3. 본문 : 어떤 종류의 데이터든 들어올 수 있다.
  - ex) 응답메세지
  1. HTTP/1.0 200 OK
  2. Date: sun , 01 , Oct 2000 ~  <br>Last-modified : Tue, 04 , Jul <br> Content-Type : text/html
  3. HTML code ...

## 웹의 구성요소

- 프락시
    - 보통 보안을 위해서 사용한다.
    - client 와 server 사이에 위치하며
    - 요청과 응답을 필터링 하면서 제한된 컨텐츠를 제공할 수 있다.

- 캐시
    - 특별한 종류의 HTTP 프락시서버이며 
    - 자주 찾는것의 사본을 저장해 속도 증진에 힘을 쓴다.

- 게이트웨이
    - 다른 서버들의 중개자 역할을 한다.
    - 주로 HTTP 트래픽을 다른 프로토콜로 전환하기 위해 사용된다.

- 터널
    - 두 커넥션 사이에서 날(raw) 데이터를 열어보지 않고 그대로 전달
    - 비 HTTP 데이터를 하나 이상의 HTTP 연결을 통해 그대로 전달
    - SSL 트래픽을 HTTP 커넥션을 전송
    
- 에이전트
    - 사용자를 위해 HTTP 요청을 만들어주는 program 
    - ex) chrome , safari