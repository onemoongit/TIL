# Server Side Template > Mastache

View 는 View 부분에 충실해야 한다. 이를 잘 나타내준 템플릿이 `Mustache` 그리고 `Handlebars` 가 있다. 두개 다 `Logic-less Template` 을 충실하게 하고 있으며 , Mustache 뒤를 이어 Handlebars가 나온것으로 보인다.
둘중 어떤것을 사용할 지 고민이라면  [Mastache VS Handlebars](https://medium.com/@_JuanGallo/mustache-vs-handlebars-42e531eca252) 여기를 참고하여 서로 비교를 하고 선택하는 것을 추천한다.

예전에는 node에서 `handlebars`를 잘 사용해왔으나 스프링에서는 참고하기 힘들었고, 현재로써 웹 개발자로 쭉 갈 생각이 없기 때문에 조금 더 참고 문헌이 많은 `Mustache` 를 선택했다.

## Using Includes 

나는 partials라고 알고있는 Include에 대해서 말해보자 매우 간단한 로직히다.

`{{>partial}}` 을 사용하면 자동으로 classpath:template/patial.html 을 찾게 된다.

또한 따로 partial 폴더를 만드는 경우 `{{partial/target}}` 을 사용해도 된다.

## Layout

Lambda를 사용해서 Layout 을 구성할 수 있다.


> Mustache 참고
>> [The Joy of Mustache: Server Side Templates for the JVM](https://spring.io/blog/2016/11/21/the-joy-of-mustache-server-side-templates-for-the-jvm) <br/>
 [기록은 재산이다 - Mustache 공유](https://supawer0728.github.io/2018/03/14/Mustache/)