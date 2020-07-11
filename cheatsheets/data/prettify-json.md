---
title: Prettify JSON
---

```sh
python -m json.tool [inline] [outfile]
```

```sh
python -m json.tool file.json
```

Useful if posting from clipboard.

```sh
echo '{"foo":1}' | python -m json.tool
```
```
{
    "foo": 1
}
```
