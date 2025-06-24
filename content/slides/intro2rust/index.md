---
title: intro2 Rust
description: An introduction to Rust talk I gave on 42Urduliz
date: 2024-05-20
---

# intro2rust @ 42 Urduliz
I went to 42 Urduliz Fundación Telefónica to give an introductory talk about Rust.
Check the slides [here](https://jonboh.dev/intro2rust/) and the [source code](https://github.com/jonboh/intro2rust)

During the Q&A, there were a couple of interesting discussions centered around the performance and
initial complexity of a Rust project.

1. How does C and Rust performance compare?
Essentially, one should be able to get mostly the same performance for **identical** programs,
in some cases the equivalence might not be obvious for a newcomer, as things like vector indexing
in Rust will implicitly add a bound check that will make our program panic if we are out of bounds.
In C, the bound check does not exist and will result in undefined behavior, a segfault etc...
Doing microbenchmarking one can see this effects and conclude that C is obviously faster than Rust.
However one could always use the `unsafe get_unchecked` interface of Vec to get the same performance.
So in this case (as it is almost always the case), Rust forces you to acknowledge the danger and
complexity head on.

2. Does it make sense to use Rust for a small project? Will I be crippled by lifetimes and traits?
I think we sometimes get hang up on optimizing things that don't need optimizing.
Whenever I'm building something new I'll use `clone`, `unwrap` wherever I need to get to a minimally
working thing (whatever it is I'm doing). At that point, once I'm happy with the proof of concept I'll
make the necessary changes to avoid unnecessary clones and to properly handle errors or options that
were previously unwrapped. Once that is finished I might not even need to use lifetimes and traits,
especially if it is a small project.
