defmodule Statistics.LinearRegression do

  def calculate({x_values, y_values}, next_x_value) do
    slope(x_values, y_values) * next_x_value + y_intercept(x_values, y_values)
  end

  def y_intercept(x_values, y_values) do
    average(y_values) - (slope(x_values, y_values) * (average(x_values)))
  end

  def slope(x_values, y_values) do
    (x_averages_times_y_averages(x_values, y_values) - average_of_x_times_y(x_values, y_values)) /
    (x_averages_squared(x_values) - averages_of_x_squared(x_values))
  end

  defp x_averages_times_y_averages(x_values, y_values) do
    average(x_values) * average(y_values)
  end

  defp average_of_x_times_y(x_values, y_values) do
    Enum.zip(x_values, y_values)
    |> Enum.map(fn({x, y}) -> x * y end)
    |> average
  end

  defp x_averages_squared(x_values) do
    :math.pow(average(x_values), 2)
  end

  defp averages_of_x_squared(x_values) do
    Enum.map(x_values, fn(x) -> :math.pow(x, 2) end)
    |> average
  end

  defp average(values) do
    Enum.sum(values) / Enum.count(values)
  end
end
