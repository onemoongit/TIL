# Split vs Tokenizer 

- 4개의 값은 받도록 의도했다고 가정하자
- Delimter : ,

## Split 

- in : a,b,c,d
    - out : [a,b,c,d]
- in : a,b,,d
    - out : [a,b, ,d]
- in : a,b,c,
    - out : [a,b,c]
    - out : [a,b,c, ] (`limit 4`)

## StringTokenizer

- in : a,b,c,d
    - out : [a,b,c,d]
- in : a,b,,d
    - out : [a,b,d]
- in : a,b,c,
    - out : [a,b,c]

## 즉

- 의도된 값에서 마지막이 없는 경우
    - split 과 tokenizer 둘다 기본적으로 마지막이 없는 경우는 처리를 하지 않는다.
    - 하지만 split 에서 limit을 준 경우에는 처리가 가능하다
- 중간에 값이 빈 경우
    - split 은 이를 빼먹지 않고 공백으로 출력한 반면에
    - tokenizer 는 값이 빈 경우 생략하고 출력한다.
