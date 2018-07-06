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
## 