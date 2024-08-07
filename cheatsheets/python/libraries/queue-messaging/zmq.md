# ZeroMQ (ZMQ)

ZeroMQ is a high-performance asynchronous messaging library.

## Key Features
- Supports various messaging patterns (pub/sub, request/reply, etc.)
- No central broker, can be used for direct inter-process communication
- Very fast and lightweight

## Basic Usage

```python
import zmq

context = zmq.Context()
socket = context.socket(zmq.REP)
socket.bind("tcp://*:5555")

while True:
    message = socket.recv()
    print(f"Received request: {message}")
    socket.send(b"World")
```