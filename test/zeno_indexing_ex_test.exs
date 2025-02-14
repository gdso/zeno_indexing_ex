defmodule ZenoIndexingExTest do
  use ExUnit.Case
  doctest ZenoIndexingEx

  alias ZenoIndexingEx, as: Z

  test "Exercise generate_key()" do
    test_cases_path = Path.join([__DIR__, ~s(../../test_cases.json)])
    {:ok, test_cases_binary} = File.read(test_cases_path)
    {:ok, test_cases} = Jason.decode(test_cases_binary)

    negative_test_cases =
      test_cases
      |> Enum.filter(&(&1["should_error"] == true))

    # |> Enum.take(3)

    for {t, _i} <- Enum.with_index(negative_test_cases) do
      %{"result" => _expected_result, "should_error" => should_error, "a" => a, "b" => b} = t
      # if i == 0 do
      if should_error == true do
        assert({:error, _code, _reason} = Z.generate_key(a, b))
      end
    end

    positive_test_cases =
      test_cases
      |> Enum.filter(&(&1["result"] != nil and &1["should_error"] != true))


    for {t, i} <- Enum.with_index(positive_test_cases) do
      %{"result" => expected_result, "should_error" => _should_error, "a" => a, "b" => b} = t
      # if i == 0 do
      if expected_result != nil do
        assert({:ok, result} = Z.generate_key(a, b))
        assert(expected_result == result)
      end
    end
  end
end
