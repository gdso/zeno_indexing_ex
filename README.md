# zeno_indexing_ex

An Elixir implementation of David Greenspan's approach to [fractional indexing implementation](https://observablehq.com/@dgreensp/implementing-fractional-indexing@547),
enabling your Elixir backend to generate ordered keys compatible with keys 
generated on the client-side (using TODO `zeno-indexing-js`). 

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `zenos_indexing_ex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:zenos_indexing_ex, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/zeno_indexing_ex>.

