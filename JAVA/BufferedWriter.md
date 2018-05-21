# BufferedWriter ? 

파일에서의 입력을 위한 자바의 라이브러리

일반 System.out.println 보다 효율이 좋기 때문에 알고리즘에서 사용한다면 효율이 좋다.

## 콘솔창에 입력하기

```java

BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(System.out));
writer.write("hello ");
writer.write("world");
writer.flush(); or writer.close();

```

- flush() vs close()
    - write 를 사용한 후에 flush 나 close 를 사용해야 콘솔에 입력된다.
    - 둘의 차이를 보자
    1. flush()
        - flush 는 현재 버퍼에 써져있는 것을 입력하는 것으로 끝낸다.
        - 버퍼는 그대로 열려 있어서 write 를 바로 사용할 수 있다. 
    2. close()
        - close 또한 현재 버퍼에 써져있는 것을 입력할 때 쓴다.
        - 하지만 말 그대로 버퍼가 닫힌다. 따라서 write 를 사용하고 싶다면 다시 writer를 불러와야 한다.

## Catch Exception

BufferedReader 와 마찬가지로 예외를 잡아야 한다. try catch를 사용하거나 throws Exception 을 꼭 사용하도록 하자.

