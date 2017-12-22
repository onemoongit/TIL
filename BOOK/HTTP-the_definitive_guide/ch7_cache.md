# 캐시

웹 캐시는 자주 쓰이는 문서의 사본을 자동으로 보관하는 HTTP 장치다. 웹 요청이 캐시에 도착했을 때 , 캐시된 로컬 사본이 존재한다면 , 그 문서는 원 서버가 아니라 그 캐시로부터 제공된다.

- 캐시는 불필요한 데이터 전송을 줄여서, 네트워크 요금으로 인한 비용을 줄여준다.
- 캐시는 네트워크 병목을 줄여준다. 대역폭을 늘리지 않고도 페이지를 빨리 불러 올 수 있게 된다.
- 캐시는 원 서버에 대한 요청을 줄여준다. 서버는 부하를 줄일 수 있으며 더 빨리 응답할 수 있게 된다.
- 캐시는 거리로 인한 지연을 줄여준다. (멀리서 불러올수록 시간이 더 많이 걸리기 때문에)

어떻게 캐시가 성능을 개선하고 비용을 줄이는지, 효과를 어떻게 측정하는지 , 효과를 극대화하기 위해 어디에 위치시켜야 하는지 설명한다.

## 불필요한 데이터 전송

다수의 클라이언트가 원 서버 페이지에 접근할때 클라이언트들에게 각각 한 번씩 전송하는데, 똑같은 바이트들이 네트워크를 통해서 반복해서 이동한다. 이 불필요한 데이터 전송을 막기 위해서 캐시를 이용하면 첫번째 클라이언트 응답은 캐시에 보관된다. 캐시된 사본이 뒤이은 요청들에 대한 응답으로 사용될 수 있기 때문에 , 원 서버의 트래픽 낭비가 줄어들게 된다.

## 대역폭 병목
