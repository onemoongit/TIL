# MarkDown Guide
- - -
### # 제목 (Header)

가장 많이 쓰는 서식중 하나 제목은 #으로 표현한다

\#을 쓴다면  \<h1>
\## 를쓰면 \<h2>
html 과 동일하게  h1 ~ h6 까지 사용할 수 있다.

### \> 인용문 사용

> 이것이 인용된 구문입니다.

### escape
md 형식에서 벗어나고 싶을때는 \를 앞에 사용한다.

ex) \\# 헤더가 아니다.


### list 형식 - + * 123

- 도트로 표시
  - 앞에 한개의 텝간격을 놓는다면 하위 리스트 구성

숫자형 리스트는 어떠한 번호를 사용하더라도 (아래가 더 작더라도) 내림차순으로 정의된다.
1. 첫번째
3. 두번째
2. 세번째

<pre>
1. 첫번째
3. 두번째
2. 세번째
</pre>

### 코드 사용

- pre 사용
<pre> hello world and
  new line hello with tab </pre>

- code 사용
<code> hello world and
  new line hello with tab </code>

- \~~~ 사용 (끝 부분에도 \~~~ 를 사용해야 한다. )
~~~
hello world and
  new line hello with tab
~~~

- \``` 사용(\~~~ 과 동일)

```js
var hello = 0;
let world = 1;
```
- 하나의 팁 (코드 시작에 사용언어를 붙인다.)
<pre>
위를 작성한 코드
```js
var hello = 0;
let world = 1;
```
</pre>



### 수평선 만들기 + 줄바꿈
아래의 줄은 모두 수평선을 만든다.

<pre>
* * *

***

*****

- - -

--------------------------------
</pre>  


문단과 문단사이는 엔터키 두번
줄바꿈은 빈칸 두개로 표현한다.


### 링크


- 참조 링크 ( url scheme이 있으면 기본링크 사용 )
  https://google.com




- 인라인 링크
  <pre>[Go Google](https://google.com)</pre>
  [Go Google](https://google.com)  


### 강조

<pre>
*single asterisks*
_single underscores_
**double asterisks**
__double underscores__
++underline++
~~cancelline~~
</pre>

*single asterisks*
_single underscores_
**double asterisks**
__double underscores__
++underline++
~~cancelline~~


### 이미지

<pre>
![Alt text](/path/to/img.jpg)
![Alt text](/path/to/img.jpg "Optional title")
</pre>


---------------------

###Reference
https://gist.github.com/ihoneymon/652be052a0727ad59601
https://simhyejin.github.io/2016/06/30/Markdown-syntax/
