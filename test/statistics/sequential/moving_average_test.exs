defmodule Statistics.Sequential.MovingAverageTest do
  use ExUnit.Case

  test "returns moving averages with 5 points of smoothness" do
    values = [50, 49, 48, 47, 48, 49, 50, 51, 50, 51, 52, 53, 52, 51, 50, 49, 48, 47, 46, 45, 46, 47, 48, 49]

    expected_results = [48.4, 48.2, 48.4, 49.0, 49.6, 50.2, 50.8, 51.4, 51.6, 51.8, 51.6, 51.0, 50.0, 49.0, 48.0, 47.0, 46.4, 46.2, 46.4, 47.0]

    assert Statistics.Sequential.MovingAverage.calculate(values, 5) == expected_results
  end

  test "returns moving averages with 4 points of smoothness" do
    values = [50.0, 49.0, 48.0, 47, 48, 49, 50, 51, 50, 51, 52, 53, 52, 51, 50, 49, 48, 47, 46, 45, 46, 47, 48, 49]

    expected_results = [48.25, 48.5, 49.0, 49.625, 50.25, 50.75, 51.25, 51.625, 51.75, 51.5, 50.875, 50.0, 49.0, 48.0, 47.125, 46.5, 46.25, 46.5, 47.0, 47.625, 48.25]

    assert Statistics.Sequential.MovingAverage.calculate(values, 4) == expected_results
  end

  test "returns moving averages with 3 points of smoothness" do
    values = [50, 49, 48, 47, 48, 49, 50, 51, 50, 51, 52, 53, 52, 51, 50, 49, 48, 47, 46, 45, 46, 47, 48, 49]

    expected_results = [49.0, 48.0, 47.666666666666664, 48.0, 49.0, 50.0, 50.333333333333336, 50.666666666666664, 51.0, 52.0, 52.333333333333336, 52.0, 51.0, 50.0, 49.0, 48.0, 47.0, 46.0, 45.666666666666664, 46.0, 47.0, 48.0]

    assert Statistics.Sequential.MovingAverage.calculate(values, 3) == expected_results
  end
end
