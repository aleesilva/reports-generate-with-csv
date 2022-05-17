defmodule GenReport.Parser do
  def parse_file(file_name) do
    file_name
    |> File.stream!()
    |> Stream.map(&parse_lines/1)
  end

  defp parse_lines(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> convert_in_list()
  end

  defp get_month(month) do
    case month do
      1 -> "janeiro"
      2 -> "fevereiro"
      3 -> "março"
      4 -> "abril"
      5 -> "maio"
      6 -> "junho"
      7 -> "julho"
      8 -> "agosto"
      9 -> "setembro"
      10 -> "outubro"
      11 -> "novembro"
      12 -> "dezembro"
      _ -> ""
    end
  end

  defp convert_in_list([head | tail]) do
    [hours, day, month, year] = Enum.map(tail, &String.to_integer/1)
    [String.downcase(head) | [hours, day, get_month(month), year]]
  end
end
