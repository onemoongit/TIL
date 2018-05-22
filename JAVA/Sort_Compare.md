# Sort 를 적절하게 사용해보기

```java
Arrays.sort​(T[] a)
// 배열의 경우
Collections.sort​(List<T> list)
// ArrayList 의 경우
```

위에 나와있는 sort 같은 경우는 기본적으로 오름차순으로 Array 를 정렬시켜준다. 

하지만 막상 문제를 직면하게 되면 단순히 오름차순 정렬만으로는 원하는 결과를 얻지 못하는 경우가 많은데 , 이럴 경우 `Comparator` 라는 함수를 구현해서 sort의 기준을 마음대로 변경할 수 있다.

```java
Arrays.sort​(T[] a, Comparator<? super T> c)

Collections.sort​(List<T> list, Comparator<? super T> c)
```

## 사용법

`Interface Comparator<T>` 라는 인터페이스가 있고 , 이를 상속받아 핵심 메소드인 `compare` 라는 함수를 `@Override` 를 하면 우리가 원하는 정렬을 설정할 수 있다.

기본 `compare` 함수의 경우에는 아래와 같이 되어있다. 이 경우에는 오름차순이다.

```java 
// T 는 오브젝트 타입이다.
int compare(T o1,T o2){
    if(o1 > o2) return 1;
    else if (o1 == o2) return 0;
    else return -1;
}

// 그리고 내림차순으로 변경하고 싶을 때는 반대로 해주면 된다.
int compare(T o1,T o2){
    if(o1 > o2) return -1;
    else if (o1 == o2) return 0;
    else return 1;
}
```

이를 통해서 다양한 값이 들어온 경우에도 원하는 결과를 도출할 수 있다.

예를 들어 arrayList에 String[] 이 들어가고 [0](0번째 인덱스) 기준으로 오름차순으로 정렬한 뒤 , [0] 값이 동일한 경우 [2] 값을 비교해서 오름차순으로 정렬한다고 가정한다면 아래와 같은 함수가 사용될 것이다.

```java 
Collections.sort(list, new Comparator<String[]>() {
            @Override
            public int compare(String[] o1, String[] o2) {
                int age1 = Integer.parseInt(o1[0]);
                int age2 = Integer.parseInt(o2[0]);

                if(age1 > age2) return 1;

                else if(age1 == age2) {
                    int order1 = Integer.parseInt(o1[2]);
                    int order2 = Integer.parseInt(o2[2]);

                    if(order1 > order2) return 1;
                    else if (order1 == order2) return 0;
                    else return -1;
                }

                else return -1;
            }
        });
```

또는 이렇게도 표현될 수 있다.

```java 

    Collections.sort(list,new comp());

    public static class comp implements Comparator<Integer>{
        @Override
        public int compare(Integer o1, Integer o2) {
            // 위와 동일한 로직
        }
    }

```
이 처럼 [0] 값이 동일한 경우에 따로 분기문을 만들어 처리한다면 원하는 결과를 하나의 함수로 표현할 수 있다.

## 주의

위에서 보면 T 는 오브젝트 타입이라고 설명하였다. 따라서 기본 타입인 int,double 등은 포함되지 않는다 , int 값을 정렬하기를 원한다면 Integer를 사용한 Array 혹은 ArrayList 가 들어가야 한다.