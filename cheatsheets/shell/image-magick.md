---
title: Image Magick
description: Create, edit, compose, or convert digital images in a variety of formats
---


## About

- [Homepage](https://imagemagick.org/script/)


## Download

- [Download](https://imagemagick.org/script/download.php) page.

### Install from source

```sh
$ wget https://download.imagemagick.org/ImageMagick/download/ImageMagick.tar.gz
```

### Debian or Ubuntu

```sh
sudo apt-get install imagemagick
```

Or

```sh
$ sudo add-apt-repository ppa:isage-dna/imagick
$ sudo apt-get update
$ sudo apt-get upgrade
```

### macOS

```sh
$ brew install imagemagick
```


## Help

```console
$ magick --help
Usage: magick tool [ {option} | {image} ... ] {output_image}
Usage: magick [ {option} | {image} ... ] {output_image}
       magick [ {option} | {image} ... ] -script {filename} [ {script_args} ...]
       magick -help | -version | -usage | -list {option}
```

```console
$ convert  --help
Version: ImageMagick 7.0.11-13 Q16 x86_64 2021-05-17 https://imagemagick.org

...

Usage: convert [options ...] file [ [options ...] file ...] [options ...] file

Image Settings:
  -adjoin              join images into a single multi-image file
  ...
```


## Usage

See [CLI](https://imagemagick.org/script/command-line-processing.php) doc.

```sh
$ magick image.jpg image.png 
```

With options:

```sh
$ magick label.gif +matte \
  \( +clone  -shade 110x90 -normalize -negate +clone  -compose Plus -composite \) \
  \( -clone 0 -shade 110x50 -normalize -channel BG -fx 0 +channel -matte \) \
  -delete 0 +swap  -compose Multiply -composite  button.gif");
```

### Size

```sh
$ magick -size 640x480 
```

```
-size width[xheight][+offset]
```

### Crop

```sh
$ magick '*.jpg' -crop 120x120+10+5 thumbnail%03d.png
$ # More efficient
$ magick '*.jpg[120x120+10+5]' thumbnail%03d.png
```

### Shadow

{% raw %}

```
-shadow percent-opacity{xsigma}{+-}x{+-}y{%}
```

{% endraw %}

