# Check OS

```sh
echo $OSTYPE
```
```
darwin19.0
```
```
linux-gnu
```

Add a value only if true.

```sh
echo "Hello $([[ "$OSTYPE" == "darwin"* ]] && echo 'Mac')"
Hello Mac

echo "Hello $([[ "$OSTYPE" == "linux"* ]] && echo 'Mac')"
Hello 
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE3ODM1OTY5NDRdfQ==
-->