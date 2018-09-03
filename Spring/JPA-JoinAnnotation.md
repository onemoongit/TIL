# 일대다 , 다대다 연결하기 ( @OneToMany , @ManyToMany )

@OneToMany 혹은 @ManyToMany 를 연결하면 의도치 않게 중간에 연결하는 테이블이 생성 될 것이다. 예를 들어서 A 라는 테이블과 B 라는 테이블을 연결한다면 A 와 B 를 연결하는 릴레이션 테이블이 하나 더 생성되는 것이다.

이는 조금 생각해보면 그 이유를 쉽게 알 수 있는데 RDB 의 특징 중 하나인 원자성 때문이다. RDB는 여러개의 값을 가질 수 없고 나눌 수 없는 값을 가져야 한다는 것이 원자성이다.

이 원자성 때문에 배열을 넣을 수 없는 것이고 JPA 에서 배열을 넣은 Many 쪽 테이블을 넣으려고 할 때 이를 관계 릴레이션을 통해서 설정하려 하기 때문이다.

하지만 이렇게 자동으로 설정된 테이블이 싫을 수도 있다. 그렇다면 이를 어떻게 해결해야 할까?

## @JoinTable / @JoinColumn  

먼저 @JoinTable 은 위와 비슷하지만 테이블 이름과 매핑되는 외래키 이름을 설정해 줄 수 있다.

```java
@JoinTable(
    name="AAndB",
    joinColumns=
        @JoinColumn(name="A_ID", referencedColumnName="ID"),
    inverseJoinColumns=
        @JoinColumn(name="B_ID", referencedColumnName="ID")
)
```



## @MappedBy

