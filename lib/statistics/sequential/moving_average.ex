defmodule Statistics.Sequential.MovingAverage do
  require Integer

  def calculate(values, points) do
    moving_averages(values, points)
    |> centered_moving_averages(points)
    |> Enum.drop(- points + 1)
  end

  defp centered_moving_averages(values, points) do
    if Integer.is_even(points) do
      moving_averages(values, points)
    else
      values
    end
  end

  def moving_averages(values, points) do
    values
    |> Stream.with_index
    |> Stream.map(fn({_, index}) -> average(values, points, index) end)
  end

  defp average(values, points, initial) do
    Enum.slice(values, initial, points)
    |> average
  end

  defp average(numbers) do
    Enum.sum(numbers) / Enum.count(numbers)
  end
end
