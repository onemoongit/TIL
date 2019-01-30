# Core Data

 

## Ch1 

#### CoreData ?
코어데이터란 OS X 와 iOS 에서 사용하는 객체 그래프 관리자면서 영속성 프레임워크이다.

데이터를 저장하고 읽을 수 있지만 MySQL 이나 SQLite 처럼 관계형 데이터베이스는 아니다. 따라서 Primary Key , table, row라고 생각하면 안된다.,

NSPersistantContainer 는 코어데이터에서 데이터를 저장하고 가져올수 있도록 하는 객체들이다.

#### Persistence

 영속성 지속성을 말한다. 데이터베이스 혹은 코어데이터를 사용하는 이유
 
 #### flash freeze
 OS가 순간적으로 메모리에 저장해 놓아서 홈버튼으로 나간후 들어와도 데이터가 남아있다. 따라서 코어데이터 영속성에 대해서 제대로 된 테스트를 해보고 싶다면 앱을 껏다가 재 실행하면 된다.
 
 ### Modeling Your Data
 
 #### Managed Object Model
 menaged object model 을 생성하는 것이 첫번째이다. 이는 디스크에서 코어데이터를 나타내는 방식이다. 참고로 default 설정으로 코어데이터는 저장소로 SQLite를 사용한다는 것을 알아두자 따라서 데이터 모델을 데이터베이스 스키마로 생각할 수가 있다.
 
 #### KVC
 코어데이터로 데이터 접근을 할때 Key-Value Coding 방식으로만 접근을 할 수 있다는 것을 알아두자 KVC를 사용하면 NSManagedObject를 dictionary 처럼 접근할 수 있다. NSObject를 상속하는 객체에서만 사용할 수 있으며 NSManagedObject 는 NSObject를 상속한다. 
 
 #### NSManagedObjectContext
 간단하게 보조메모리로 생각할 수 있다. 데이터를 저장할 때 두가지 단계로 나뉜다고 생각하자, 먼저 Context에 저장하고 난 뒤 모든 상황이 괜찮다면 `commit`을 통해서 디스크에 저장할 수 있다. 이 단계를 save로 한번에 처리할 수 있다.
 
 ### Fetching from CoreData
 Fetch 또한 Managed Object Context로 접근해야 한다. NSFetchRequest 는 데이터를 가져오는 것에 책임을 가진 클래스이다. qulifiers 를 통해서 원하는 데이터를 정제해서 가져올 수 있다. 또한 Generic 타입으로서 가져오는 NSManagedObject 타입에 대한 예상 타입을 선택할 수 있다.
 
 

> reference []()
