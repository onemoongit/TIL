# Linux And JAVA
- 참고로 여기서는 사용하지 않았지만, linux 에서는 apt-get 이 아닌 yum 을 사용한다.

## 간단한 방식

$ sudo yum install -y java-1.8.0-openjdk-devel.x86_64

$ sudo /usr/sbin/alternatives --config java

$ sudo yum remove java-1.7.0-openjdk

[참고 블로그 - 기억보단 기록을 ](https://jojoldu.tistory.com/261)
 
### JAVA 8 기준

우분투에서는 apt-get 으로 관련 파일들을 다운받아서 사용했는데, linux 에서는 tar 를 다운받아서 압축을 풀고 관련 설정을 해줬다.

1. 관련 자바 파일 설치 
```
$ cd /opt/

$ wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u171-b11/512cd62ec5174c3487ac17c61aaa89e8/jdk-8u171-linux-x64.tar.gz"

$ tar xzf jdk-8u171-linux-x64.tar.gz
```

2. alternative 설정

```
$ cd /opt/jdk1.8.0_171/
$ alternatives --install /usr/bin/java java /opt/jdk1.8.0_171/bin/java 2
$ alternatives --config java
```

3. javac / jar command 설정
```
$ alternatives --install /usr/bin/jar jar /opt/jdk1.8.0_171/bin/jar 2
$ alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_171/bin/javac 2
$ alternatives --set jar /opt/jdk1.8.0_171/bin/jar
$ alternatives --set javac /opt/jdk1.8.0_171/bin/javac
```

4. check installed java version

`java -version`

5. 자바 환경변수 설정

```
$ export JAVA_HOME=/opt/jdk1.8.0_171
$ export JRE_HOME=/opt/jdk1.8.0_171/jre
$ export PATH=$PATH:/opt/jdk1.8.0_171/bin:/opt/jdk1.8.0_171/jre/bin
```




[참고](https://tecadmin.net/install-java-8-on-centos-rhel-and-fedora)