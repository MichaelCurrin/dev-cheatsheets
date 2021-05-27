---
title: Pillow (PIL fork)
description: The Python Image Library
---

Pillow is a fork of PIL.


## Resources

- [python-pillow.org](https://python-pillow.org/)
    > This is the home of Pillow, the friendly PIL fork. PIL is the Python Imaging Library. If you have ever worried or wondered about the future of PIL, please stop. We're here to save the day.
- [python-pillow/Pillow](https://github.com/python-pillow/Pillow)


## Installation

```sh
$ pip install --upgrade Pillow
```


## Basic usage

From [Tutorial](https://pillow.readthedocs.io/en/latest/handbook/tutorial.html) in the Handbook.

```python
from PIL import Image

im = Image.open("hopper.ppm")

print(im.format, im.size, im.mode)
# PPM (512, 512) RGB
```


## Resize image

Based on [AWS lab](https://amazon.qwiklabs.com/focuses/16506?catalog_rank=%7B%22rank%22%3A1%2C%22num_filters%22%3A0%2C%22has_search%22%3Atrue%7D&parent=catalog&search_id=11282443).

```python
from PIL import Image


def resize_image(image_path, resized_path):
    with Image.open(image_path) as image:
        image.thumbnail((128, 128))
        image.save(resized_path)
```
