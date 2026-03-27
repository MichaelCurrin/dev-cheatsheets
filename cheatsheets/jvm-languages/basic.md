---
description: Setup and run a greeting across languages
---
# Basic

## Java

`Hello.java`
```java
public class Test {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
```

Compile and run:
```sh
javac Hello.java
java -jar Hello.jar                                                                                        
```

Run directly:

```sh
java Hello.java
```

## Kotlin

`hello.kt`

```kotlin
fun main() {
    println("Hello, World!")
}
```

Compile and run:

```sh
kotlinc hello.kt -include-runtime -d hello.jar
java -jar hello.jar                                                                                        
```

