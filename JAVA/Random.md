# Random 

## how to Create Random Number
1. Math.random
1. java.util.Random.nextInt
1. java.util.Random.ints (Java 8)


## 1. Math.random
가장 간편하게 사용할 수 있으며 0을 포함한 값부터 1보다 작은 double 형 값을 리턴한다.

따라서 1~200 까지의 값을 얻고 싶다면 아래 코드의 result 값이 될것이다. 

```java
int result = Math.random()*200+1;
```

200.297 등의 숫자가 나올수 있는데 이 값은 int로 변환되면서 버려진다.

## 2. java.util.random
결국 사용하기 편리한 Math.random 함수는 이 util.random 클래스를 통해서 값을 생성하게 된다.

또한 멀티 스레드에 영향을 줄 수 있기 때문에 만약 반복적인 random 사용이 필요하다면 java.util.random 을 사용하는 것을 추천한다.

```java
Random rad = new Random(long seed);
rad.nextInt(int bound);
rad.nextDouble();
// bound가 없다면 표현할 수 있는 모든 범위의 값을 리턴한다.
```

## 3. java.util.random(java8)
java8에서 추가된 `Random.inits(int origin,int bound)`라는 메서드가 있다. 

사용법은 2번과 동일하며 시작점을 정해줄 수 있다는 점이 다르다. 


- 결국 Math.random 안에서 java.util.random 객체를 생성해서 리턴하기 때문에 여러번 사용한다면 util.random을 사용하자

