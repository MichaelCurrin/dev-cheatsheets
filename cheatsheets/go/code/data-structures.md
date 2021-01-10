# Data types: Data structures

Based on [Learn X in Y](https://learnxinyminutes.com/docs/go/).


## Array

List of elements with fixed length. This is better for memory usage - as a fixed amount of memory can be allocated.

Note that you cannot use `append`.

### Create

```go
// Initialize to four zeroes.
var my_array [4]int
```

```go
// Infer the size. Still fixed length.
my_array2 = [...]int{1, 2, 3, 4}
my_array2[0] = -1
```

### Copy

Arrays have _value_ semantics so values are kept separate.

```go
// Copy to new instance.
array_copy := my_array
```

```go
// Update value (in copy only).
array_copy[0] = 100

my_array[0] == array_copy[0]
// false
```


## Slice

List of elements with dynamic length. More commonly used than arrays.

### Create

```go
my_slice = []int{1, 2, 3, 4}

my_slice2 = make([]int, 4)

var float_slice = [][]float64
```

### Copy

Slices have _reference_ semantics, so values are shared across instances.

```go
slice_copy := my_slice

// Update value (in both). 
slice_copy[0] = 100

my_slice[0] == slice_copy[0]
// true
```

### Append

Here we use the `append` function to create an updated array and overwrite the current object.

```go
slice3 := []int{1, 2, 3}

// Append one or more values.
slice3 := append(slice, 3, 4, 5)

// Extend the slice with another slice.
slice3 := append(slice3, []int{6, 7, 8})

slice
// [1, 2, 3, 4, 5, 6, 7, 8]
```
