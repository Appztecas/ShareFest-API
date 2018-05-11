defmodule SharefestApiWeb.AuthErrorHandler do
  @moduledoc """
  Module that send an error when authentication fails
  """
  import Plug.Conn

  def auth_error(conn, {type, _reason}, _opts) do
    body = Poison.encode!(
      %{
        status: "error",
        data: nil,
        errors: [to_string(type)]
      })
    send_resp(conn, 401, body)
  end

end
