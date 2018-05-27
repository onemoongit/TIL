# REST 아키텍쳐

### [REST 아키텍쳐](https://spoqa.github.io/2012/02/27/rest-introduction.html)
### [REST 설계 디자인](https://spoqa.github.io/2013/06/11/more-restful-interface.html)

- 모바일 환경에서 헤더에 api 정보 또한 담아준다면 강제 업데이트를 확인할 필요가 없다.

## URI 뒤에 붙는 쿼리의 용도
- 너무 길게 주는것은 좋지 않다. ( 수 제한이 있다. )

## URI 설계시에 주의해야 할 점
- 소문자를 사용해야 한다. 

## 요청 헤더 
- referer 를 통해서 어디에서 유입이 되었는지 확인할 수 있다.

## POST PUT
- 바디에 몇바이트인지 넣어줘야 한다. 
    - content-length 에 넣어준다. 