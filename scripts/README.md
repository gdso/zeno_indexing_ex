# Scripts

## 1) `./reformat_test_cases.exs`

The `reformat_test_cases.exs`  is a script that converts test cases
Greenspan wrote in his original code samples and reformats them into a 
JSON file (yes, I too am not a fan of JSON, but this is the world we live in)
that multiple languages can load and test against. 

### Running the script

Since `./reformat_test_cases.exs` depends on `Jason` being available,
it must run in the `test` environment of the `./../mix.exs` project.

    MIX_ENV=test mix run ./scripts/reformat_test_cases.exs

NOTE `mix` calls must be made whilst in the directory where the `mix.exs` 
is present (which defines a `Mix.Project` -- i.e. go up a directory to use 
the `mix run` command above.





