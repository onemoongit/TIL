# forever 

## start 

- node 어플리케이션 시작

## list

- start로 실행한 프로그램들의 현황을 forever list 로 확인이 가능하다.

## restart

- list 에서 어떠한 이유로 stop 되었거나 프로그램이 변경되었을 경우 restart 를 통해서 재 시작 해준다.

## stop

- 서버를 내릴때 사용한다.

## log 

<code>Ex) forever -l "logfile.log.path" -a ./bin/www</code>

- -l 은 log파일 뒤에 "Path" 인 곳에 log파일을 작성한다.
    - forever list 에서 log 파일의 위치를 확인할 수 있다.
- -a 는 log파일 뒤에 append 하라는 뜻이다.

- 참고로 -e 를 사용하면 error log 를 찍어주는데 이는 다른 파일로 설정이 가능하다!


