# Swagger Spring Boot

## Gradle 의존성 추가

Springfox Swagger 2 그리고 Springfox Swagger UI 를 사용했다 ( 2.7.0 )

```
    compile group: 'io.springfox', name: 'springfox-swagger2', version: '2.7.0'
    compile group: 'io.springfox', name: 'springfox-swagger-ui', version: '2.7.0'
```

## Docket Bean 설정

swagger 는 Docket Bean 을 타겟으로 해서 설정을 한다. 따라서 설정 클래스 파일을 만들어 줘야 한다.

예를 들어 com.ex.app.config 라는 패키지를 만들어 그 안에 SwaggerConfig 클래스를 만들어주자 

```java
package com.example.app.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Configuration
@EnableSwagger2
public class SwaggerConfig {
    @Bean
    public Docket api() {
        return new Docket(DocumentationType.SWAGGER_2)
                .select()
                .apis(RequestHandlerSelectors.any())
                // .apis(RequestHandlerSelectors.basePackage("com.example.gonggu.Controller"))
                .paths(PathSelectors.any())
                .build();
    }
}


```


@EnableSwagger2 를 통해서 설정이 가능하다

.api 에서 `RequestHandlerSelectors.any()` 를 사용하면 모든 api 를 문서로 만든다. 보통은 원하는 부분만 api 로 작성을 하기 때문에 `.apis(RequestHandlerSelectors.basePackage("com.example.app.Controller"))` 를 사용하면 Controller 에서만 작성한 모든 API 를 문서화 시킬 수 있다.

예를들어 user 와 setting 에 관한 controller 만 api 문서화 하고 싶다고 하자

```java
return new Docket(DocumentationType.SWAGGER_2)
    .select()
    .apis(RequestHandlerSelectors.basePackage("com.example.gonggu.Controller"))
//                .paths(PathSelectors.any())
    .paths(PathSelectors.regex("\\/(user|setting)\\/\\w*")) // 여기에 정규 표현식이 사용 된다.
    .build();
```

이를 통해서 Controller 에서도 원하는 경로만 선택하여 문서화 할 수 있다. 굉장히 편리한 기능이 아닐 수 없다!

하다가 느낀 점은 정규표현식을 다 까먹어서 많이 헷갈렸다는 점이다. 다음에는 정규표현식에 대해서 포스팅을 해봐야겠다.

참고로 정규표현식에 관해서 테스트를 해보고 싶다면 [여기](https://regexr.com/)를 참조해 보자 아래 Text 부분에 자신이 테스트 하고 싶은 경로들을 적은 후 위에 정규표현식으로 테스트 해보면 된다 굉장히 유용한 사이트이다!




[참고](http://springboot.tistory.com/24)

