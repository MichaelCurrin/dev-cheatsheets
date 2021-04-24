# Clean code

On how to write clean code, according to Uncle Bob. He has a blog, gives talks at conferences and he has an online course which he has released on video. There is some duplication across the videos.

- [blog.cleancoder.com](https://blog.cleancoder.com/)


## A

- [Clean code lesson 1 on YouTube](https://youtu.be/Wibk0IfjfaI)


Quotes by Uncle Bob and others he references in the video. My comments are in brackets.

- The only way to go fast is to go well. (And in coding that means to stay clean.)
- If we all checkin a module (into version control) so it is better than when we checked it out, then all our code would get better with time.

What is clean code?

- Clean code is elegant (it does a lot with a simple command), efficient (saves processing resources) and does one thing well.
- Clean code is simple, direct and reads like well written prose. There are no surprises. It is what you expect.


## B

[Clean Code - Uncle Bob - Lesson 1](https://youtu.be/7EmboKQH8lM) on YouTube

- A function should have one job and do well.
- Clean code is when each function is mostly what you expect it to be. No surprises.
- Code should be readable, reusable and modifiable.

### Function parameters

- If is does more things or has if statements, make those functions.
- If there are shared variables in your large function, that sounds like a case for a class with state. Although that's the OOP way, so if you're doing FP then don't do that but you can pass a type structure to functions.
- When it has one job, your length will probably be 3 or 4 lines which is good. Sometimes 6.
- A function should typically take 1 to 2 parameters, 3 if you must. The number of unit tests to write for combinations of parameters grows exponentially so with a factorial calculation. So more than 3 becomes much harder to test.
- Avoid using a boolean parameter. It means you have to do an if statement. See if you can break out one function into two instead. The name of the function can tell you what they do instead of a flag.
- Use polymorphism in FP or OOP so can have dynamic dispatch that is a few lines. Rather than a fragile if/else section that is long to read, might miss cases and you have to remember to update it.
- If you are looking up a value nested in a data structure, you don't want to do this all over the place. Make it a function or a method. It is easy to use and to change.
- Design patterns are important to understand. We can use a word to communicate and know how that pattern will be implemented.
