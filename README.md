# zeno_indexing_ex

A little fractional indexing library you can use to generate ordered keys
(sequences) in your Elixir backend, compatible with keys generated on the
client-side (using TODO `zeno-indexing-js`).

This library's implementation to fractional indexing borrows generously and
gratefully from David Greenspan's
[notebook](https://observablehq.com/@dgreensp/implementing-fractional-indexing@547).

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `zeno_indexing_ex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:zeno_indexing_ex, "~> 0.1.0"}
  ]
end
```

This library's documentation be found at <https://hexdocs.pm/zeno_indexing_ex>.

## FAQ

### Q: Why yet another fractional indexing library?

`zeno_indexing_ex` was initially written in the context of
[StepTree](https://www.steptree.co) where client/browser code generated
fractional indices. Over time, for conflict resolution as well for testing, it
became clear that the backend server, written in Elixir, would have to generate
fractional indices as well.

At the time of its writing, I didn't know of any Elixir implementations, and I
was afraid it might drift by accident or on purpose from the Javascript
implementations out there, so I decided to take matters into my own hands.

### Q: What's with the name?

Well I wanted to pick a unique name, and I do think Zeno's
[dichotomy paradox](https://en.wikipedia.org/wiki/Zeno%27s_paradoxes#Dichotomy_paradox)
is analogous to how in theory fractional indexing works, assuming we had
infinitely precise floating point numbers, of course!
