# File handling

Using the built-in [os](https://pkg.go.dev/os) package.

## Open file

```go
file, err := os.Open("file.go") 
if err != nil {
	log.Fatal(err)
}
```
```
open file.go: no such file or directory
```

Read into a slice of bytes:

```go
data := make([]byte, 100)

count, err := file.Read(data)
if err != nil {
	log.Fatal(err)
}

fmt.Printf("read %d bytes: %q\n", count, data[:count])
```


## Stats

```go
func checkFileExists(filePath string) bool {
  if _, err := os.Stat(filePath); err != nil {
    if os.IsNotExist(err) {
      return false
    }
  }
  
  return true
}

exists = checkFileExists("my-path.txt")
```

Last modified time, size, and is directory.

```go
stats, err = os.Stat("my-file.txt")
if err != nil {
  panic(err)
}

stats.ModTime()
stats.Size()
stats.IsDir()
```

## Write file

### Create or overwrite

Simple:

```go
import "io/ioutil"
```

```go
out_data = []byte("My file contents\n")
ioutil.Writefile("my-path.txt", out_data, 0644)
```


```go
func handleError(err error) {
  if err != nil {
    panic(err)
  }
}

f, err = os.CreateFile("my-path.txt")
handleError(err)

defer f.Close()

f.Name()

f.WriteString("My file contents\n")

out_data := []bytes{"a", "b", "c", "\n"}
f.Write(out_data)
```

From Go docs - [OpenFile](https://pkg.go.dev/os#example-OpenFile).

```go
package main

import (
	"log"
	"os"
)

func main() {
	f, err := os.OpenFile("notes.txt", os.O_RDWR|os.O_CREATE, 0755)
	if err != nil {
		log.Fatal(err)
	}
	if err := f.Close(); err != nil {
		log.Fatal(err)
	}
}
```

### Append

From Go docs - [OpenFile Append](https://pkg.go.dev/os#example-OpenFile-Append).

```go
package main

import (
    "log"
    "os"
)

func main() {
    // If the file doesn't exist, create it, or append to the file
    f, err := os.OpenFile("access.log", os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0644)
    if err != nil {
        log.Fatal(err)
    }
    if _, err := f.Write([]byte("appended some data\n")); err != nil {
        log.Fatal(err)
    }
    if err := f.Close(); err != nil {
        log.Fatal(err)
    }
}
```


Based on [SO](https://stackoverflow.com/questions/7151261/append-to-a-file-in-go) top voted answer.

```go
f, err := os.OpenFile(filename, os.O_APPEND|os.O_WRONLY|os.O_CREATE, 0644)
if err != nil {
    panic(err)
}

defer f.Close()

if _, err = f.WriteString(text); err != nil {
    panic(err)
}
```


## Directories

### Create

```go
os.MkDir("my-dir", os.ModePerm)
os.MkDirAll("my/nested/my-dir", os.ModePerm)
```

### Delete

```go
defer os.Remove("my-dir")
defer os.RemoveAll("my/nested/my-dir")
```

### Working directory

```go
os.Getwd()
```

### Current process

```go
exedir, _ = os.Executable()
```

If you do `go run main.go` the result will be a binary executable in a temp directory.

### Contents

```go
contents = ioutils.ReadDir(".")
for _, fi := range contents {
    fmt.Println(fi.Name(), fi.IsDir())
}
```
