# Core Data

 

## Ch1 CoreData App - Hit List

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
 
 ## Ch2  NSManagedObject SubClasses
 
 ### Binary Data
바이너리 데이터의 경우에는 PDF 나 image 등 바이너리로 표현될 수 있는 여러가지 데이터들이 저장될 수 있다. 하지만 CoreData의 특성상 많은 양의 데이터가 저장된다면 앱이 실행될 때 불러오는 시간이 길어지기 때문에 좋지 않다. 이런 경우를예측하고 Allow External Storage 라는 옵션을 설정할 수 있는데, 옵션이 설정되면 코어데이터가 학습해서 따로 파일을 뺀 포인터를 저장할 것인지 아니면 직접 저장시킬 것인지 판단한다.

### Save Non-Standard Data

Transformable Protocol을 통해서 NSCoding protocol을 채택한 데이터를 저장할 수 있다.

### SubClasses

Model을 설정해 놓으면 Xcode에서 자동으로 class를 만들어 준다. 하지만 Codegen에서 manual/none 으로 설정한 뒤 editor -> create subclass 로 subclass들을 만들수 있다. 

이렇게 서브 클래스를 만들면 2가지 장점이 있다.
1. KVC에서 피할 수 없는 human error 가 줄어든다
    - key value 를 사람이 직접 코딩하다보면 오타가 생길 수 있고 이는 치명적인 에러를 발생시킬 수 있다. 반면에 subclass를 통한 접근은 오타로 인한 에러를 없앨 수 있다.
2. NSManagedObject에 대한 method를 override 하거나 새로운 메서드를 추가할 수 있다.
    - 하지만 기본적으로 접근하면 안되는 메서드들이 존재하는데 이는 [문서](https://developer.apple.com/documentation/coredata/nsmanagedobject)에 자세하게 나와있다.
 
 ### propagating a managed object
 
 코어데이터 관점에서 NSManagedObjectContext  를 접근하는방식
 
장점은 object context가 아래로 내려가는 방식이기 때문에 조금 더 깔끔한 코드를 작성할 수 있다.

> reference [raywenerlich CoreData](https://store.raywenderlich.com/products/core-data-by-tutorials)

## Ch3 CoreData Stack

코어데이터는 아래 네가지의 코어데이터 클래스로 이루어져 있다.

1. NSManagedObjectModel
1. NSPersistentStore
1. NSPersistentStoreCoordinator
1. NSManagedObjectContext

### NSManagedObjectModel
data model 의 객체의 타입을 나타낸다. model을 통해서 내부 프로퍼티나 다른 객체들 사이의 관계를 확인할 수 있고, SQLite를 사용한다면 database 의 scheme 이라고 생각하면 된다. 

하지만 SQLite 는 코어데이터가 선택할 수 있는 여러가지 저장소 중에 하나이기 때문에 scheme자체라고 말할수는 없다는 것을 기억해두자

### NSPersistanceStore

사용하기로 한 저장소에 데이터를 읽고 쓴다. 저장소에는 총 4가지 타입이 있고, 1개의 non-atomic persistent store 그리고 3개의 atomic persistent store 가 있다. 참고로 `atomic persistent store` 란 앱에서 데이터를 읽고 쓰려고 할 때 메모리에 데이터를 모두 로드해야 하는 저장소를 의미하고 `non-atomic persistent store`란 필요한 데이터의 일부분만 메모리에 로드해도 되는 저장소를 말한다.  

1. NSQLiteStoreType
    - 유일한 non-atomic
    - SQLite database 를 사용한다.
    - default 로 설정 되어있다.
1. NSXMLStoreType
    - atomic 
    - XML 파일 자체를 저장소로 사용한다.
    - 사람이 쉽게 읽을 수 있다는 장점이 있다.
1. NSBinaryStoreType
    - atomic
    - 바이너리 데이터를 사용하며 거의 없다.
1. NSInMemoryStoreType
    - atomic 
    - 사실상 핸드폰을 재 실행하면 메모리가 초기화되기 때문에 persistent 라고 할수는 없다.
    - 보통 캐싱처리에 많이 사용된다.
    
- 참고로 최근에는 NSIncrementalStore를 통해서 JSON 이나 CSV 를 저장소로도 사용할 수 있다.


### NSPersistentStoreCoordinator

model 과 store 를 연결해주는 다리 역할을 한다. 저장소에서 데이터를 읽거나 저장하는 역할을 담당하며 가장 어려운 부분이다.

### NSManagedObjectContext

사실상 제일 많이 보게되는 클래스이며 다음과 같은 특징을 가지고 있다.

- context는 인메모리 형식으로 잡혀있다.
- coredata에 관한 모든 작업들은 context를 통해서 이루어 진다.
- coredata에서는 어떤 작업을 하더라도 save가 호출되지 않으면 변경되지 않는다.
- 만들거나 가져오는 객체에 대한 LifeCycle을 관리한다.
- not Thread-safe

### 하나의 엔터티가 여러개의 엔터티를 가질때

예를 들어서 Dog 라는 Entity 가 Walk라는 Entity를 여러개 가지고 있는 형태로 엔터티를 설계하고 싶을때,

Dog 에서 Attribute에 Walks를 추가하는 것이 아니라 Relationship에서 walks 라는 relationship을 생성한 뒤 Destination을 Walk 그리고 Inverse 를 Dog로 설정한다.

그 후 Walk라는 엔터티에서 dog 라는 relationship을 만들고 Destination을 Dog로 Inverse를 walks로 설정한다.

이러한 관계를 설정하고 나서 Codegen 을 Manual/none 으로 설정한 뒤 서브클래스를 만들어보자 여러개의 메서드들이 추가된 것을 알 수 있다. 실제로 코드를 살펴보자

```swift
// ViewController

 if let dog = currentDog,
      let walks = dog.walks?.mutableCopy()
        as? NSMutableOrderedSet {
      walks.add(walk)
      dog.walks = walks
    }

//    currentDog?.addToWalks(walk)
```

dog.walks 는 NSOrderedSet으로 immutableset이다. 따라서 이를 사용하려면 mutableSet으로 복사를 한 뒤 사용해야 하는 불편함이 있다. 이는 서브클래스의 간단한 메서드로 대체가 가능하니 알아두자


## Ch4 Intermediate Fetching


NSFetchRequest instance 를 생성한 뒤 가져올 데이터에 대해 NSPredeticate 설정한 뒤 NSManagedObjectContext에 전달하면 원하는 데이터를 가져올 수 있다. 

> https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Predicates/AdditionalChapters/Introduction.html


### Stored Fetch Request

data model에 맞춘 Fetch Reqeust 를 xcdatamodeld 에 설정 해놓을 수 있다. Entity 추가 하는 것 처럼 Fetch Request 를 생성하면 된다. 그 후 아래코드와 같은 fetchRequest를 만들 수 있다.

```swift 
guard let model = 
  coreDataStack.managedContext
    .persistentStoreCoordinator?.managedObjectModel,
  let fetchRequest = model
    .fetchRequestTemplate(forName: "FetchRequest")
    as? NSFetchRequest<Venue> else {
      return
}
// .persistentStoreCoordinator?.managedObjectModel 까지 접근해야 한다는 것을 알아두자
// fetchReqeustTemplate(forName: "FetchRequestName")
```

### Fetching Diffrent Result Types

NSFetchRequest 는 resultType property 를 가지고 있다. default 는 여태 사용했던 .managedObjectResultType 이다. 그리고 총 4개의 type이 있다.

1. .managedObjectResultType 
    - managedObject 배열을 리턴한다.
    - return NSFetchRequest\<NSManagedObject> 
1. .countResultType 
    - fetch request에 맞는 아이템의 갯수를 리턴한다.
    - return NSFetchRequest\<NSNumber> 
1. .dictionaryResultType
    - 내장된 함수를 통해 계산이 된 딕셔너리를 리턴한다. 예를 들어 특정 Propety들을 더한 값을 리턴할 수 있다. NSExpression 에 대해서 검색해보자
    - return NSFetchRequest\<NSDictionary> 
1. .managedObjectIdResultType
    - object의 unique id 를 리턴한다.
    - return NSFetchRequest\<NSManagedObjectID> 
    - iOS 5 이전에는 thread-safe 라서 자주 쓰였지만 현재는 그렇지 않아서 자주 쓰이지 않는다.


### Sorting Fetched Results 

`NSSortDescriptor`를 통해서 결과에 대한 정렬을 할 수 있다. 이 정렬은 memory가 아닌 SQLite에서 작업이 이루어 진다는 것을 알아두자.

String에 대해서 정렬을 할때 NSString.localizedStandardCompare 라는 셀렉터를 선택할 수 있는데 이는 각자 언어에 맞춘 정렬을 제공한다는 뜻이다.

또한 `NSSortDescriptor.reversedSortDiscriptor`를 통해서 반대의 정렬도 제공받을 수 있으니 참고하자


### Asynchronous Fetching

여태까지 한 작업들은 모두 main thread에서 진행된 작업들이다. 이는 app freezing을 초래할 수 있으며 좋지 않은 방법이다. 이를 피하기 위해서 2가지를 준비하면 `NSAsynchronousFetchRequest`를 사용할 수 있다.

1. NSFetchRequest
1. completion Handler

### Batch Updates

메일에서 `Mark all as read` 를 생각해보자 기존의 방식이라면 하나하나 다 접근을 한 뒤 isRead 라는 bool 값을 true 라고 설정해줘야 할 것이다.

이는 굉장히 비효율적이고 iOS8부터 batch update를 통해서 손쉽게 설정할 수 있다. 아래의 코드를 참고하여 필요한 곳에 적절하게 활용해보자

```swift
let batchUpdate = NSBatchUpdateRequest(entityName: "Venue")
batchUpdate.propertiesToUpdate = 
  [#keyPath(Venue.favorite): true]

batchUpdate.affectedStores = 
  coreDataStack.managedContext
    .persistentStoreCoordinator?.persistentStores

batchUpdate.resultType = .updatedObjectsCountResultType

do {
  let batchResult = 
    try coreDataStack.managedContext.execute(batchUpdate)
      as! NSBatchUpdateResult
  print("Records updated \(batchResult.result!)")
} catch let error as NSError {
  print("Could not update \(error), \(error.userInfo)")
}\

```




