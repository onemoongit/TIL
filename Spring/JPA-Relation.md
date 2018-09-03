# JPA Relation

이번에는 JPA 에서 연관관계를 어떻게 처리하는지에 대해서 알아보겠습니다. 현실적으로 하나의 테이블을 사용하는 서비스는 없습니다. RDB를 사용한다면 다양한 PK(Primary Key) 와 FK(Foreign Key) 를 통해서 관계를 구성하고 이를 이용해 다양한 처리를 하게 됩니다.

따라서 데이터베이스를 설계할때 삽입이상이나 삭제이상 등 여러 이상이 없는지 확인해야 하며 (정규화) , 이에 맞춰 정확하고 신중하게 설계해야 합니다. JPA 도 마찬가지로 의도한 관계가 정확하게 작동하는지 잘 확인해야 합니다.

이번에 알아볼 내용은 아래와 같습니다.

- 객체 간 연관관계 설정
- 단방향 , 양방향 관계의 이해

## 연관관계 처리의 순서와 사전 설계

서버를 연습할때 가장 흔하고 기본적인 예로 게시판을 꼽습니다. 댓글이나 조회 페이징 처리 등 간단해 보이는 게시판에는 수 많은 쿼리와 설계가 필요하고 이를 제대로 구현해 내는 능력이 중요합니다.

연관관계 처리의 예시로서 게시글과 댓글의 관계를 들겠습니다. 먼저 아래와 같은 단계를 거쳐야 합니다.

1. 각각의 클래스를 정의합니다.
1. 각 클래스의 연관관계에 대한 설정을 추가합니다.
1. DB상의 원하는 형태의 테이블이 만들어지는지 확인합니다.
1. 테스트 코드로 동작을 확인합니다.

이를 통해서 테이블이 만들어지기 때문에 목적에 맞는 정확한 테이블 설계능력은 필수입니다. 이를 ERD(Entity Relation Diagram) 로 그림을 그리고 방향과 연관관계에 대해서 정확하게 설계하고 넘어가야 합니다.

연관관계는 아래와 같이 4가지로 나타낼 수 있습니다.

1. 일대일 (@OneToOne)
1. 일대다 (@OneToMany)
1. 다대일 (@ManyToOne)
1. 다대다 (@ManyToMany)

또한 JPA 에서는 방향성을 명시해줘야 합니다.

1. 단방향 참조 (UniDirectional) 
    - 한쪽의 클래스만이 다른 클래스의 인스턴스를 참조하도록 설정
1. 양방향 참조 (Bidirectional)
    - 양쪽 클래스 모두 다른 클래스의 인스턴스를 참조

이러한 개념을 숙지하고 게시판 예제를 한번 만들어보겠습니다.

