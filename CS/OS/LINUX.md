# About Linux 

### MAC (OSX)

- Linux 는 아니지만 unix라는 공통의 조상을 가지고 있다.


## File & Directory

### $pwd : 현재 위치하고 있는 곳이 중요하다. 꼭 확인할 것 

| 명령어 | 옵션 | 대상 | 설명 |
| :--- | :--- | :--- | :--- |
| * | --help |  | 도움말  ex) rm --help| 
| man |  | {이름} | 도움말 > 조금 더 상세하게 보여줌 ( 별도의 공간 ) | 
| pwd |  | | 현재 위치한 경로를 확인 | 
| ls |  | | 현재 폴더에 있는 파일들 확인 | 
| ls | -a | | 폴더에 숨겨진 파일까지 확인 | 
| ls | -l | | 폴더에 파일을 자세하게 확인 | 
| mkdir | | {이름}  | 이름을 가진 폴더 생성 (make directory) | 
| touch | |  {이름} | 이름을 가진 파일 생성 | 
| cd | |  {이름}| 이름을 폴더로 이동 (change directory) | 
| rm |  |  {이름}| 이름을 가진 파일 삭제 | 
| rm | -r | {이름} | 이름을 가진 폴더 삭제 | 
| cp |  | {타겟 대상} | 타겟 파일을 대상파일로 복사 |
| cp | -r  | {타겟 대상} | 타겟 폴더를 대상 경로로 복사 |
| cp | -f  | {타겟 대상} | 이미 존재하는 경우에 파일을 지우고 복사 |
| mv | |  {타겟 대상} | 파일의 이동 | 
| mv | -r |  {타겟 대상} | 폴더의 이동 | 

### 파이프와 필터

앞 프로그램의 결과를 뒤 프로그램 입력 값으로 전달
사용법 : ls -al /usr/bin | more

#### 필터
`grep`을 활용하면 필요한 부분만 확인할 수 있다.





### 옵션 설명


- -r : recursive /  보통 폴더안에 모든 내용에 대해서 적용할 때 사용된다
- -f : force / 강제로 진행할 때 사용된다.







> 참고 [생활코딩 유튜브 ](https://www.youtube.com/watch?v=DsG-JWrFJTc&list=PLuHgQVnccGMBT57a9dvEtd6OuWpugF9SH)