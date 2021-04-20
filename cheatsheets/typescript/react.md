---
title: React with TypeScript
---

Recommended - [How to use TypeScript with React... But should you?](https://www.youtube.com/watch?v=ydkQlJhodio) on YouTube.


## Functional Component

If you are going to define a function using an object assigned to anonymous function, you can assign it a type.

By default, you'll get `props.children` as an attribute. 

```typescript
import { FS } from 'react'

const Foo:FC = (props) => {
  return <>{ props.children }</>
}
```

But you can add your attributes to check them. And warn if they are unused.

```typescript
import { FS } from 'react'

interfact FooProps {
  foo: number;
  bar: string;
}

const Foo:FC<FooProps> = (props) => {
  return <>{ props.foo } { props.bar }</>
}
```

Using the component.

```jsx
<Foo foo={123} bar="abc" />
```

You can use `useState` like this - types will be inferred.

```typescript
const Foo:FC<FooProps> = (props) => {
  const [data, setData] = useState('hello, world')
}
```
