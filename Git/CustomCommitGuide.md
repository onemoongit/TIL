# Onemoon Commit Guide

## Introduction

이 마크다운 문서는 저만의 커밋 스타일을 정하고자 만든 문서입니다. 평소에 커밋을 하면서 규칙을 찾기 애매한 부분들이 존재했고, 이를 정리한 규격에 맞춰서 커밋을 구체화 시킬 예정입니다.

기본적인 베이스는 udacityCommitStyleGuide 를 따르고 있습니다.


## Base
```
<Type> 

<Body>

<footer> 
```

## Type

타입에는 타입과 함께 바뀌는 파일 혹은 핵심 기능을 명시합니다. 아래는 타이틀에 사용할 타입들입니다.

- `Feat` : 새로운 기능을 생성할때 사용
- `Add` : 기존에 있는 기능에 코드를 추가할 때 사용
- `Refactor` : 기존 코드를 다른 방식으로 개선할 때 사용
- `Remove` : 필요없는 코드 혹은 사라지는 기능을 제거할 때 사용
- `Test` : 테스트 코드의 추가 혹은 변경 등 관련된 항목에 대한 코드 수정 시 사용
- `Docs` : Readme , gitignore 등의 문서를 작성할 때 사용


## Body

Body 는 각 타입에 대한 설명과 기능들에 대한 설명을 적습니다. 예를 들어 `유저생성`이라는 새로운 기능을 추가한 경우에는 아래와 같이 적습니다.

```
Feat : User Create

user create function and JPA logic
```

#### 타입은 하나의 타입으로 추가하는 것을 우선으로 합니다. 만약 두가지 이상의 타입이 추가된다면 Body 에 각 타입에 대한 설명을 적습니다.

## Footer

Footer 에는 이슈에 대한 명시 , assignee , project 등 코드 자체가 아닌 코드 이외의 필요한 부분에 대해서 명시합니다.

단, 여러 분야에 대한 언급이 필요한 경우 dash(-) 를 사용해서 구분합니다.

```
- issue : #25 , #48
- reference : https://google.com
```

## Example

```
Feat : User Create

user create function and JPA logic

- issue : #25 , #48
- reference : https://google.com

```