# Error 

# Spring database API ( JPA )

## Error creating bean with name 'entityManagerFactory' 
- spring boot 2.0 issue
- setting maven 

```
<dependency>
    <groupId>org.hibernate</groupId>
    <artifactId>hibernate-core</artifactId>
    <version>5.2.17.Final</version>
</dependency>
<dependency>
    <groupId>org.hibernate</groupId>
    <artifactId>hibernate-entitymanager</artifactId>
    <version>5.2.17.Final</version>
</dependency>
```

- \+ java 9 setting

```
<dependency>
    <groupId>javax.xml.bind</groupId>
    <artifactId>jaxb-api</artifactId>
    <version>2.3.0</version>
</dependency>
```

> https://stackoverflow.com/questions/40058001/error-creating-bean-with-name-entitymanagerfactory-defined-in-class-path-resou#


## SpringBoot mysql 연결
##### gradle ( maven 확인 x )
spring 에서 mysql 을 연결할 때 mysql-connector 라는 라이브러리를 이용한다. 문제는 gradle 에서 호환이 아직 잘 안되어서 그런지 connector 최신 라이브러리를 사용했을 때 jdbc 를 인식하지 못하는 에러가 발생했다.
- 해결
    - connector 버전을 6.0.6 으로 낮추니 제대로 인식하게 되어 해결되었다.
    - mysql 은 5.6 v
