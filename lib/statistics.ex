defmodule Statistics do
  alias Statistics.Sequential.MovingAverage

  def forcast(_) do
    []
  end

  def moving_average(values, points \\ 3) do
    MovingAverage.calculate(values, points)
  end

  def linear_regression(_) do
    []
  end
end
