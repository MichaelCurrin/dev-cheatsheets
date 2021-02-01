---
title: Structure
description: How to layout your Deno project.
---

Put everything in your top-level directory.

Based on [Oak](https://deno.land/x/oak) as a reference.

- `docs/`
- `examples/`
- `fixtures/`
- `fizz/`
    - `common.ts` (or `lib.ts`?)
    - `buzz.ts`
- `index.ts`
- `index_test.ts`
- `foo.ts`
- `foo_test.ts`
- `util.ts`
- `util_test.ts`
- `types.d.ts`
- `depts.ts` - central dependencies.
- `test_deps.ts` - dependencies for tests.
- `README.md`

Or put your code in `src` and `tests`. The tests can be in `src` if you want to distribute them with you application.
