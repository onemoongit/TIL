# process & process

## 현재 사용중인 프로세스 확인

<code>

    ps -e       // 사용중인 프로세스 확인
    ps -ef      // 사용중인 프로세스를 조금 더 자세히 확인
</code>




## 특정 포트를 사용하는 프로세스 정보 확인하기

<code> 

    lsof -i TCP:x       // TCP 에 대한 포트 x 확인
    lsof -i TCP:22-80   // TCP 에 대한 포트 22~80 확인
    lsof -i             // 모든 포트를 확인
    lsof -i :80         // 80번 포트 (http) 확인
</code>

