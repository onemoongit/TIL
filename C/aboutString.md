# Read or Write String or char[]

## scanf vs fget vs fgets
- scanf 
    - 공백을 읽지 못하므로 라인을 읽는데에는 무리가 있다.
- fget
    - 크기에 제한이 없어 문제가 생길 수 있다.
    - 예를들어 char hello[10]에 11개의 char를 넣으려고 했을 때 에러가 생겨버린다.
- fgets
    - fget 에다가 길이 제한을 건 함수
    - fgets( *var , sizeof(pointer) , stdin)
        - 배열이라면 sizeof지만 포인터라면 직접 길이를 적어줘야 한다.
        - file 혹은 stdin(키보드) 가 될 수 있다.

>[참고 - 벼리](http://egloos.zum.com/lechocolat/v/441439)


## strcpy

배열(문자열)을 사용한다는 점을 먼저 알아두자. `strcpy` 와 `strncpy` 가 많이 쓰인다.

- strcpy
    - 문자열 그대로를 복사한다.
    - strcpy(str1,str2)
        - str2의 내용을 str1에 복사한다. (str1 이 결과)
- strncpy
    - 문자열의 길이를 제한할 수 있다.

단 strncpy를 사용할때는 배열의 길이를 그대로 적용하면 안되고, 마지막 자리를 문자열이 끝났다는 문자를 넣어야 한다.

> [참고 - 가나다](http://enter.tistory.com/144)


