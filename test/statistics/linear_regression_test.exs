defmodule Statistics.LinearRegressionTest do
  use ExUnit.Case

  test "get next value" do
    y_values = [50, 49, 48, 47, 48, 49, 50, 51, 50, 51, 52, 53, 52, 51, 50, 49, 48, 47, 46, 45, 46, 47, 48, 49]
    x_values = (1..24)
    values = {x_values, y_values}
    next_x_value = Enum.count(y_values) + 1

    expected_results = 47.69565217391304

    assert Statistics.LinearRegression.calculate(values, next_x_value) == expected_results
  end

  test "get value for x value -1" do
    y_values = (1..24)
    x_values = (1..24)
    values = {x_values, y_values}

    expected_results = -1.0

    assert Statistics.LinearRegression.calculate(values, -1) == expected_results
  end

  test "y_intercept" do
    y_values = [50, 49, 48, 47, 48, 49, 50, 51, 50, 51, 52, 53, 52, 51, 50, 49, 48, 47, 46, 45, 46, 47, 48, 49]
    x_values = (1..24)

    expected_results = 50.30434782608695

    assert Statistics.LinearRegression.y_intercept(x_values, y_values) == expected_results
  end

  test "slope" do
    y_values = [50, 49, 48, 47, 48, 49, 50, 51, 50, 51, 52, 53, 52, 51, 50, 49, 48, 47, 46, 45, 46, 47, 48, 49]
    x_values = (1..24)

    expected_results = -0.10434782608695654

    assert Statistics.LinearRegression.slope(x_values, y_values) == expected_results
  end
end
