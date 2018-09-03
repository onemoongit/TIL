# Swift Grammar

## 증감 연산자
- ++ -- 이 없다는 것을 기억하자
    - 만약에 비슷한 기능을 만들고 싶다면 아래와 같은 기능을 사용해야한다.
    - += 1 혹은 -= 1

## for문은 없다
- Swift에서는 for문 단독으로 쓰는 것이 아닌 `for-in` 구문을 사용한다는 것을 기억하자


## print without \n
값을 출력하다보면 개행문자 없이 출력하고 싶을 때가 있다. swift에서는 print를 사용하면 기본적으로 {SomeStr}+"\n" 이 들어가게 되는데 이를 쉽게 해결할 수 있다.

- print(someValue,seperator:,terminator:)
- print(someValue , terminator: " ")
    - 이는 개행문자 없이 출력한다.
- print(someValue,someOtherValue,seperator: " + ")
    - 이는 아래와 같이 출력된다.
    - someValue + someOtherValue
 
`terminator` 와 `seperator`의 의미를 명확하게 알아야 한다. 

## Omitting Argument Labels

func 를 보다 보면 네이밍 앞에 _ ( underbar ) 가 있는 함수들이 있다. 이를 사용하면 Argument Label 을 사용하지 않아도 func를 사용할 수 있다.