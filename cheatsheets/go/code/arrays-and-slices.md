# Arrays and slices

Based on [Learn X in Y](https://learnxinyminutes.com/docs/go/).

Note use of curly braces for array - `{}`. This likely comes from C, as that is the syntax for an array (fixed length).

In the slice section below, you'll see hard brackets - `[]`. This syntax is more like the dynamic-sized lists or arrays in Python or JavaScript.


## Array

List of elements with **fixed** length. This is better for memory usage - as a fixed amount of memory can be allocated.

Note that you cannot use `append` here.

### Create

Initialize with null values. Here we have four zeroes.

```go
var my_array [4]int
// { 0, 0, 0, 0 }
```

Initialize with values. The length is inferred.

```go
my_array2 := [...]int{1, 2, 3, 4}
```

### Update

```go
my_array2[0] = 12
```

### Copy

Arrays have _value_ semantics so values are kept separate.

Here we make a copy of the array and update the copy only.

```go
array_copy := my_array

array_copy[0] = 100

my_array[0] == array_copy[0]
// false
```


## Slice

List of elements with **dynamic** length. More commonly used than arrays.

### Create

Empty.

```go
my_slice := []int
float_slice := [][]float64
```

With values.

```go
my_slice := []int{1, 2, 3, 4}
```

Null values.

```go
my_slice2 := make([]int, 4)
```

### Copy

Slices have _reference_ semantics, so values are shared across instances.

Create a copy and update values in both.
```go
slice_copy := my_slice

slice_copy[0] = 100

my_slice[0] == slice_copy[0]
// true
```

### Append

Here we use the `append` function to create and update slice.

```go
slice := []int{1, 2, 3}
```

Append one or more values. This is like `my_array.append(1)` in Python.

```go
slice := append(slice, 3, 4, 5)
```

Note we overwrite the existing variable. If we wanted to prefer the original variable, we could just use a different name for the new variable.

Extend the slice with another slice. This is like `my_array.extend( [6, 7, 8] )` in Python.

```go
slice := append(slice, []int{6, 7, 8})
```

Result:

```go
slice
// [1, 2, 3, 4, 5, 6, 7, 8]
```
