# Range

A series of numbers.


## Arguments

- `from` - inclusive
- `to` - exclusive
- `interval` - defaults to `1`


## Iterator

Returns as type `range`.

```python
range(10)
# => range(0, 10)
```


## Evaluated

```python
list(range(10))
# => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
```


## Increment by value

```python
range(1, 10, 2)
```


## Descending

```python
range(10, 1, -1)
```


## Check

Easy testing in the shell:

```sh
python -c 'print(list(range(1, 10, 2)))'
# => [1, 3, 5, 7, 9]
```
