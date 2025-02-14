# NOTE this is the set of tests from Greenspan's original code sample:
# --------------------
# | | a0
# | a0 Zz
# a0 | a1
# a0 a1 a0V
# a0V a1 a0l
# Zz a0 ZzV
# Zz a1 a0
# | Y00 Xzzz
# bzz | c000
# a0 a0V a0G
# a0 a0G a08
# b125 b129 b127
# a0 a1V a1
# Zz a01 a0
# | a0V a0
# | b999 b99
# | A00000000000000000000000000 !error
# | A000000000000000000000000001 A000000000000000000000000000V
# zzzzzzzzzzzzzzzzzzzzzzzzzzy | zzzzzzzzzzzzzzzzzzzzzzzzzzz
# zzzzzzzzzzzzzzzzzzzzzzzzzzz | zzzzzzzzzzzzzzzzzzzzzzzzzzzV
# a00 | !error
# a00 a1 !error
# 0 1 !error
# a1 a0 !error
# --------------------
  
# My additions are included below:
{:ok, test_cases } = """
| | a0
| a0 Zz
a0 | a1
a0 a1 a0V
a0V a1 a0l
Zz a0 ZzV
Zz a1 a0
| Y00 Xzzz
bzz | c000
a0 a0V a0G
a0 a0G a08
b125 b129 b127
a0 a1V a1
Zz a01 a0
| a0V a0
| b999 b99
A00000000000000000000000000 | !error
| A00000000000000000000000000 !error
| A000000000000000000000000001 A000000000000000000000000000V
zzzzzzzzzzzzzzzzzzzzzzzzzzy | zzzzzzzzzzzzzzzzzzzzzzzzzzz
zzzzzzzzzzzzzzzzzzzzzzzzzzz | zzzzzzzzzzzzzzzzzzzzzzzzzzzV
a00 | !error
a00 a1 !error
0 1 !error
a1 a0 !error
"""
# to avoid generating an empty string at the end of the array
|> String.trim_trailing("\n")
|> String.split("\n")
|> Enum.map(fn test ->
  # = "| | a0"
  [a, b, result] =
    test
    # = ["|", "|", "a0"]
    |> String.split(" ")
    |> Enum.map(fn arg ->
      case arg do
        # "|" -> "null"
        "|" -> nil
        _ -> arg
      end
    end)

  %{
    a: a,
    b: b,
    result: if(result != "!error", do: result, else: nil),
    should_error: if(result == "!error", do: true, else: false)
  }
end)
|> Jason.encode(pretty: true)

IO.inspect(~s(__DIR__))
test_case_json_path = Path.join(__DIR__, "/../../test_cases.json")
IO.inspect(test_case_json_path)
IO.inspect(~s(File.exists?\(test_case_json_path\) = #{File.exists?(test_case_json_path)}))

# Path.file(Pat
dbg(test_cases)
:ok = File.write(test_case_json_path, test_cases)
