# Async

See also the docs for the builtin [asyncio](https://docs.python.org/3/library/asyncio.html) library.

## Basic concepts

### Coroutines

Asynchronous functions. They are the building blocks of async code.

Defined using `async def`.

```python
import asyncio


async def my_coroutine():
    await asyncio.sleep(1)

    return "Done"
```

### Event Loop

The core of async programming. It manages and distributes the execution of coroutines.

```python
import asyncio

loop = asyncio.get_event_loop()
loop.run_until_complete(my_coroutine())
```

## Key functions

### asyncio.run()

Runs the main coroutine and manages the event loop.

```python
import asyncio


async def main():
    await asyncio.sleep(1)
    print("Hello, async world!")


asyncio.run(main())
```

### await

Used to wait for a coroutine to complete.

```python
async def fetch_data():
    await asyncio.sleep(2)

    return "Data"


async def main():
    data = await fetch_data()
    print(data)
```

## Concurrency

### asyncio.gather()

Runs multiple coroutines concurrently.

```python
async def fetch(url):
    await asyncio.sleep(1)

    return f"Result from {url}"

async def main():
    results = await asyncio.gather(
        fetch("url1"),
        fetch("url2"),
        fetch("url3")
    )
    print(results)
```

### asyncio.create_task()

Creates a Task from a coroutine, allowing it to run concurrently.

```python
async def background_task():
    while True:
        await asyncio.sleep(1)
        print("Background task running")


async def main():
    task = asyncio.create_task(background_task())
    await asyncio.sleep(5)
    task.cancel()
```

## Async Context Managers

Use `async with` to manage asynchronous resources.

```python
import aiohttp

async def fetch_url(url):
    async with aiohttp.ClientSession() as session:
        async with session.get(url) as response:
            return await response.text()
```

## Async Iterators

Use `async for` to iterate over asynchronous sequences.

```python
async def async_generator():
    for i in range(5):
        await asyncio.sleep(1)
        yield i


async def main():
    async for num in async_generator():
        print(num)
```

## Error Handling

Use try/except blocks to handle exceptions in async code.

```python
async def might_fail():
    await asyncio.sleep(1)

    raise ValueError("Oops!")


async def main():
    try:
        await might_fail()
    except ValueError as e:
        print(f"Caught error: {e}")
```

## Asyncio REPL

```sh
$ python -m asyncio
```

Then run:

```console
>>> import asyncio
>>> await asyncio.sleep(10, result='hello')
'hello'
```

## Async Web Scraping

### Scraping Multiple Webpages Concurrently

This example demonstrates how to use async to scrape 3 webpages simultaneously.

```python
import asyncio

import aiohttp
from bs4 import BeautifulSoup


async def fetch_url(session, url):
    async with session.get(url) as response:
        return await response.text()


async def scrape_website(session, url):
    html = await fetch_url(session, url)
    soup = BeautifulSoup(html, 'html.parser')
    title = soup.title.string if soup.title else "No title found"

    return f"Title of {url}: {title}"


async def main():
    urls = [
        "https://www.example.com",
        "https://www.python.org",
        "https://www.github.com"
    ]
    
    async with aiohttp.ClientSession() as session:
        tasks = [scrape_website(session, url) for url in urls]
        results = await asyncio.gather(*tasks)
        
    for result in results:
        print(result)


if __name__ == "__main__":
    asyncio.run(main())
```

## Web server example

This example demonstrates how to implement asynchronous views in Flask using `flask_asyncio`.

Note that if tasks have to run in the background or in parallel, consider combining a queue system with Flask/Django instead. 

```sh
$ pip install flask flask-asyncio
```

```python
import asyncio

from flask import Flask, jsonify
from flask_asyncio import AsyncFlask

app = AsyncFlask(__name__)


@app.route('/')
async def hello():
    await asyncio.sleep(1)  # Simulating some async operation

    return "Hello, Async World!"


@app.route('/data')
async def get_data():
    await asyncio.sleep(2)  # Simulating a time-consuming task
    data = {"message": "This is async data"}

    return jsonify(data)


async def task1():
    await asyncio.sleep(2)
    return "Task 1 complete"

async def task2():
    await asyncio.sleep(1)
    return "Task 2 complete"


@app.route('/concurrent')
async def concurrent_tasks():
    results = await asyncio.gather(task1(), task2())

    return jsonify({"results": results})


if __name__ == '__main__':
    app.run()
```

This setup allows Flask to handle requests asynchronously, potentially improving the application's ability to manage concurrent connections, especially for I/O-bound operations.

Note that while this approach allows for async views, Flask's underlying WSGI server is still synchronous. For production use with high concurrency needs, you might want to consider using an ASGI server like Hypercorn or Uvicorn, or switching to a fully async framework like FastAPI or Quart.
