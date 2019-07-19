defmodule MealTimeWeb.LayoutView do
  use MealTimeWeb, :view

  def show_alert(conn) do
    conn
    |> get_flash
    |> flash_message
  end

  def flash_message(%{"info" => message}) do
    render MealTimeWeb.SharedView, "_alert.html", class: "uk-alert-primary", message: message
  end

  def flash_message(%{"error" => message}) do
    render MealTimeWeb.SharedView, "_alert.html", class: "uk-alert-danger", message: message
  end

  def flash_message(_), do: nil
end
