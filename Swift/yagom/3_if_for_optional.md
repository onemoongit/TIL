## 04_if_optional_playground 
#### if 

```
if (condition) {
    satate
}

or 

if condition {
    
}

```

괄호는 생략이 가능하다 하지만 중괄호는 생략이 불가능하다. 예를 들어 if boolean x+10 이 아닌 중괄호를 사용해 if boolean {x+10} 로 표현해야 한다.

- 참고로 기존에 0이 아닌 모든 값은 true로 인식되는 듯한 개념은 사용이 불가능 하다
- 무조건 condition 은 bool 타입이 와야 한다.

#### switch
- 범위 연산자를 활용하자
    - " 1..<10 => 1~9
- default 무조건 있어야 한다.
- break라고 작성하지 않아도 break가 걸린다.
    - 이가 싫다면 fallthrough 를 사용하면 아래로 내려간다.


#### looping 

```
for ${item} in ${collection} {

}

for ${튜플타입(key value)} in ${collection} {

}

while ${condition} {

}

repeat {

}while ${condition}
```

do while 은 swift에 오류 처리에서 사용하기 때문에 사용되지 않는다.


#### Optional
##### 스위프트 핵심 개념 중 하나 ! 중요하다!

- ?와 !로 표현 띄어쓰기 불허
    - ! 암시적 추출 옵셔널
        - 연산 가능 
        - 처음부터 nil 을 사용할 수 없다 
    - ? 일반적인 옵셔널
        - 연산은 불가능
- 값이 있을수도 있고 없을수도 있다
- nil 의 가능성을 명시적으로 표현 
    - 전달받은 값이 옵셔널이 아니라면 nil 체크를 하지 않더라도 안심하고 사용
- enum + general

#### optional 활용

- optional Unwrapping
    1. Optional Binding 
        - 변수에 미리 값이 있는지 물어본다
        - 옵셔널의 값을 꺼내오는 방법 중 하나
        - nil check + 안전한 값 추출
        - if-let 구문
    1. Force Unwrapping
        - 값을 강제로 가지고 나옴
        - !를 뒤에 붙여서 사용한다.

forceunwrapping 은 혹시나 nil 값이 들어가는 경우 에러의 소지가 있기 때문에 optional binding 을 사용하여 안전하게 값을 가져온다.  