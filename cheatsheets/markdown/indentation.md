---
title: Indentation
---

## Spaces

Note that while using indentation of `2` spaces is allowed in general, it will cause unexpected styling in some cases, when using Github-Flavored Markdown.

So `4` spaces is preferred.

#### When 4 spaces works well

Numbered and bullets mixed.

	1. A
	2. B.
	    - Bullet
	    - Bullet
	3. C

1. A
2. B.
    - Bullet
    - Bullet
3. C

Numbered and codeblocks mixed.

	1. A
	2. B
	    ```sh
	    $ echo 'Code block'
	    ```
	3. C

5. A
6. B
    ```sh
    $ echo 'Code block'
    ```
7. C

#### When 2 spaces breaks

Here using 2 spaces only and mix numbered and bullet points. The inner list is **not** nested.

	1. A
	2. B.
	  - Bullet
	  - Bullet
	3. C

1. A
2. B
  - Bullet
  - Bullet
3. C

Nesting code in a numbered list also does not work.

	1. A
	2. B
	  ```sh
	  $ echo 'Code block'
	  ```
	3. C

1. A
2. B
  ```sh
  $ echo 'Code block'
  ```
3. C

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
