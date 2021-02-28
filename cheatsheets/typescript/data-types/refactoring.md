# Refactoring


## Converted positional params to named params

In VS Code, under "Refactor..." you can select "Convert parameters to destructured object" to achieve this.

Original:

```typescript
function foo(repo, pkgName, logo, logoColor) {
}

// Usage:
foo(myRepo, 'bar', 'jekyll')
```

Converted to named parameters.

```typescript
function foo({
  repo,
  pkgName,
  logo,
  logoColor,
}: {
  repo: Repo;
  pkgName: string;
  logo?: string;
  logoColor?: string;
}) {
  console.log(repo, pkgName, logo, logoColor)
}

// Usage:
const pkgName = 'bar'
foo({
  repo: myRepo, 
  pkgName, // i.e. Same as `pkgName: pkgName`.
  logo: 'jekyll'
})
```

We can tidy that up making a type or interface to define the structure of the input object. Especially useful if you want to use the type or interface elswhere.

```typescript
interface IFoo {
    repo: Repo;
    pkgName: string;
    logo?: string;
    logoColor?: string;
}

function foo({
  repo,
  pkgName,
  logo,
  logoColor,
}: IFoo) {
  console.log(repo, pkgName, logo, logoColor)
}

// Usage - as previous example.
const pkgName = 'bar'
foo({
  repo: myRepo, 
  pkgName, 
  logo: 'jekyll'
})
```

Convert object params into a single object. You don't have to use an interface here. Here we renamed the interface from the above example, to show we use the interface to represent an external object and not just an interface for the function.

```typescript
interface IBazz {
    repo: Repo;
    pkgName: string;
    logo?: string;
    logoColor?: string;
}

function foo(bazz: IBazz) {
  console.log(bazz.repo, bazz.pkgName, bazz.logo, bazz.logoColor)
}

// Usage.
// The function will enforce the type anyway, but you can be explicit when
// setting up the object.
const myBazz: IBazz = {
  repo: myRepo, 
  pkgName: 'bar', 
  logo: 'jekyll'
}
foo(myBazz)
```

You could add an extra step in the function to unpack as this. But then that undoes some of the reduced lines gain in replacing `{...}` with `bazz` as a param.

```typescript
function foo(bazz: IBazz) {
  const { repo, pkgName, logo, logoColor } = bazz
  console.log(repo, pkgName, logo, logoColor)
}
```
