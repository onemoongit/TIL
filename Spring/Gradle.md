# Gradle 사용

gitignore.io 에서 igrnore 파일을 생성하고 커밋을하면 grdle 사용에 필수적인 jar 파일이 빠진다.

이를 따로 gitignore 에 등록 시켜야 한다.

#### !gradle/wrapper/gradle-wrapper.jar

[참고](https://stackoverflow.com/questions/29805622/could-not-find-or-load-main-class-org-gradle-wrapper-gradlewrappermain)

# Gradlew ?

Gradle-Wrapper 의 약자로 굳이 Gradle을 설치하지 않더라도 스프링 프레임워크를 사용할 수 있도록 하는 명령어이다.

상단에 적어놓은 gradle-wrapper.jar 가 있어야만 사용할 수 있다.

# Using Gradle With Profiles

스프링의 프로필을 사용하면서 그래들을 사용하는 명령어를 적어놓음

- -x test를 사용하면 테스트 없이 빌드할 수 있다. 
    - 테스트를 실패하면 빌드에 실패하기 때문에 꼭 필요한 테스트가 아니라면 로컬에서 확인한 후 테스트를 제외하는 것도 괜찮은 방법이다.
- SPRING_PROFILES_ACTIVE=pro1,pro2 ./gradlew bootRun 
    - 실행시키고자 할때 사용
- SPRING_PROFILES_ACTIVE=a,b,c ./gradlew build 
    - 빌드할때 사용
- nohup java -jar build/libs/project-0.0.1-SNAPSHOT.jar -Dspring.profiles.active=a,b,c -x test &
    - 백그라운드에서 앱을 실행시키고자 할 때 사용
    - nohup & 을 사용하면 백그라운드에서 앱을 사용할 수 있다. 사이에 실행시키고자하는 앱을 적는다.
