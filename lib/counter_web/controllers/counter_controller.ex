defmodule CounterWeb.CounterController do
  use CounterWeb, :controller

  def count(conn, params) do
    count =
      case Integer.parse(params["count"] || "0") do
        {int, _} -> int
        :error -> 0
      end

    render(conn, :count, count: count)
  end

  def increment(conn, params) do
    current_count = String.to_integer(params["count"])
    increment_by = String.to_integer(params["increment_by"])
    render(conn, :count, count: current_count + increment_by)
  end
end
