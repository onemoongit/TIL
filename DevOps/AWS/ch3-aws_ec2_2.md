#AWS
## EC2에 대해서 알아보자 _ 2

### AMIs (Amazon Machine Image)

가상 이미지 현재 프로그램을 그대로 유지해서 다른환경에서도 그대로 쓰일 수 있게 끔 만든다.

도커와 같다. 이미지를 만드는것 

AMI에서 이미지를 Launch하면 동일한 인스턴스를 만드는것이다 스팩들은 변경할 수 있다.

백업같은 작업을 할때 용이하다.

### aws marketplace

aws marketplace에서 원하는 이미지를 선택하고 저장할 수 있다.

### scalability

Computer 위에 운영체제를 설치하고 그 위에 프로그램을 설치한다. 이 프로그램이 가상머신이다. (소프트웨어로 만든 기계) 그 위에 여러대의 운영체제를 설치한다.

aws의 가장 큰 장점은 필요할때마다 컴퓨터의 크기를 줄였다 늘렸다 할 수 있는 능력이다. ( auto scailing을 통해서 )

### program ab (apachebench)

apache bench 라는 프로그램을 사용해서 스트레스 테스트를 할 수 있다.

요청수와 동시접속 수를 설정할 수 있으며 , 총 소요시간 초당 처리개수 실패수 개별 처리속도 등을 알 수 있다.

### Elastic IPs
###### network & security 에 있다.

인스턴스를 중지시켰다가 다시 킬 경우 ip 와 도메인이 다르다.

인스턴스를 종료시에는 ip를 회수해가고, 인스턴스를 시작하면 다시 할당해준다.

이를 회수하지 않도록 가지고 있을 수 있는데, 인스턴스에 연결한 경우에는 무료지만 인스턴스에 연결하지도 않은 채 그냥 ip만 가지고 있는다면 요금이 부과된다.

### Scale up

scale up을 할때에는 AMIs 를 통해서 기존 이미지를 복제한 후 , 설정을 늘려준다. cpu memory 등등...

그 후에 중요한 점은 elastic ips에 들어간 뒤 , 기존에 사용하던 ip를 scale up 한 instance에 붙이는 것인데 자칫 잘못하면 ip자체가 날아갈 수 있기 때문에 주의를 해야한다.

따라서 elastic IPs 에서 제대로 연결을 해제한 후 다시 연결해준다.

이렇게 해서 사용자들은 동일한 ip에 접속을 하더라도 scale up 된 인스턴스를 사용할 수 있을것이다.

### Scale out

예를들어서 처음에는 server 와 middleware db 동일한 인스턴스에 있다고 하면 , 사용자가 많아질수록 당연히 느려진다. 

scale out이란 협업을 얘기하는것인데 위와 같은 상황일경우에는 db쪽에 부하가 심하다면 읽기와 쓰기를 담당하는 db 2개로 나누어서 연결해주고 , 그 이후에는 샤딩과 같은 기술로 db쪽 부하를 줄일 수 있다.

middleware 도 나누어서 동일한 기능을 분산처리하도록 한다면 부하를 줄일 수 있다.

추가로 Load Balancer (AWS 에서는 ELB) 를 사용해서 부하를 분산할 수도 있다. 로드밸런서는 아래에서 다시 설명한다.

### Load Balancer

AWS에서 알아서 처리해주는 부하 분산 시스템

loadbalancer protocol에 http와 https 를 추가하고 instance protocol은 http만 해줘도 무방하지만 https로 한다면 암호화나 복호화를 추가하기 때문에 더 많은 자원을 사용하게 된다. 

Health Check 에서 ELB는 정기적으로 접속을 해서 해당 서버가 죽었는지 살았는지 체크를 한다. 설정한 파일을 다운로드 받는데 타임아웃이 되거나 서버가 다운되었다면 로드밸런서가 알아서 다른 서버로 분배해 줄것이다. 

### ELB ( Load Balancer ) 주의사항

데이터 베이스의 상관관계를 잘 알아야 한다. 만약 두개의 독립적인 데이터 베이스 인스턴스를 만들었다면 두개의 인스턴스를 만들어 Load Balancer를 구성했다고 생각했을때 다른 한쪽에서는 원하는 DB값을 가져올 수 없는 문제가 생기기 때문이다. 

그렇기 때문에 데이터가 저장되는곳은 ( 동적이라면 ) 별도의 컴퓨터로 빼서 별도로 관리해야 한다.

### Autoscaling 

AWS 에 보면 launch configuration 과 auto scailing gruop을 잘 구분해야 한다. 

Launch Configuration - 인스턴스를 생성하는것을 Launch Configuration 라고 한다 . 이미지를 인스턴스로 만드는 과정 !

Auto Scaling Group - 이를 통해서 실제로 만들어주는 것이다. Launch Configuration이 먼저 생성되어야 한다.

