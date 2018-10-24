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