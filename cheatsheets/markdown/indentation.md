# Indentation

## Spaces

Note that while using indentation of `2` spaces is allowed in general, it will cause unexpected styling in some cases, when using Github-Flavored Markdown.

So `4` spaces is preferred.

#### Good case

	1. A
	2. B.
	    - Bullet
	    - Bullet

1. A
2. B.
    - Bullet
    - Bullet

#### Breaking case

Here using 2 spaces only and mix numbered and bullet points. The inner list is **not** nested.

	1. A
	2. B.
	  - Bullet
	  - Bullet

1. A
2. B
  - Bullet
  - Bullet

Nesting code in a 

1.
2.
  ```sh
  $ echo 'Code block'
  ```


## Tabs

Using tabs also works fine.

	1. A
	2. B.
		- Bullet
		- Bullet

1. A
2. B.
	- Bullet
	- Bullet
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE0NzY0NzIwMDBdfQ==
-->