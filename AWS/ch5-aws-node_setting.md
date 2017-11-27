# AWS
## Node Setting

참고 [AWS Node SDK Center](http://docs.aws.amazon.com/sdk-for-javascript/v2/developer-guide/welcome.html)

## 1. module -> aws-sdk 설치

npm install aws-skd --save || yarn add aws-sdk --save

## 2. Configuration Setting

두가지 방법이 있다.

### - Global configuration AWS.config 를 사용하는 방법

        모든 서비스에 적용할 수 있다.

### - AWS의 서비스를 이용하는 것 

        각각의 서비스에 맞춰서 적용해야 한다.


### Credentials

여러가지로 인증을 하는 방법이 있는데 그중에서 Credential을 직접 만드는 것을 사용한다고 했을 때

/.aws/credentials를 만들어서 설정을 해줄 수 있다.

안에 있는 내용은 IAM에서 키값을 가져와야 한다. ( Security Service )

또한 AWS.config.region을 통해서 리전 설정을 해주는데 ~~seoul~~ 이 아닌 정식 명칭을 써야 한다. [EC2 Region List](http://docs.aws.amazon.com/ko_kr/general/latest/gr/rande.html#ec2_region)를 참고해보면 EC2를 사용할때 필요한 Region을 알 수 있다. 서울의 경우는 "ap-northeast-2" 이다.

또한 사용자를 만든 뒤에도 attach policy 를 통해서 사용자에게 권한을 줘야 한다는 점을 잊지 말자.
