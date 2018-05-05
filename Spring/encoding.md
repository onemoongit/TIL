## Spring 한글 설정

- 스프링에서 한글을 다루면 깨지는 경우가 있는데 이를 인코딩을 통해서 해결한다
- 아래에 있는 코드를 web.xml 에서 `<web-app>` 태그 내에 삽입한다.

```jsp

<filter>

    <filter-name>encodingFilter</filter-name>

    <filter-class>

        org.springframework.web.filter.CharacterEncodingFilter

    </filter-class>

    <init-param>

        <param-name>encoding</param-name>

        <param-value>UTF-8</param-value>

    </init-param>

    <init-param>

        <param-name>forceEncoding</param-name>

        <param-value>true</param-value>

    </init-param>

</filter>

<filter-mapping>

    <filter-name>encodingFilter</filter-name>

    <url-pattern>/*</url-pattern>

</filter-mapping>

```
