defmodule SharefestApiWeb.AuthController do
  @moduledoc """
  This module handle the sign in/ sign out functionality of
  administrator users
  """
  use SharefestApiWeb, :controller

  require Logger

  alias SharefestApi.Authenticator
  alias SharefestApi.People.Users

  action_fallback SharefestApiWeb.FallbackController

  def sign_in(conn, %{"user" => %{"email" => email, "password" => password}}) do
    _sign_in(conn, email, password, :password
    )
  end

  def sign_in(conn, %{"user" => %{"phone" => phone, "password" => password}}) do
    _sign_in(conn, phone, password, :password)
  end

  def sign_in(conn, %{"user" => %{"email" => email, "facebook_id" => facebook_id}}) do
    _sign_in(conn, email, facebook_id, :facebook)
  end

  def sign_in(conn, %{"user" => %{"phone" => phone, "facebook" => facebook_id}}) do
    _sign_in(conn, phone, facebook_id, :facebook)
  end

  def sign_in(conn, %{"user" => %{"email" => email, "amazon_id" => amazon_id}}) do
    _sign_in(conn, email, amazon_id, :amazon)
  end

  def sign_in(conn, %{"user" => %{"phone" => phone, "amazon_id" => amazon_id}}) do
    _sign_in(conn, phone, amazon_id, :amazon)
  end

  def sign_in(conn, _params) do
    render(conn, "error.json", %{message: "Parametros incorrectos"})
  end

  defp _sign_in(conn, username, password, method) do
    Logger.info "Looking for user_name: " <> username
    with {:ok, user} <- Users.authenticate_user(username, password, method) do
      {:ok, token, claims} =
        SharefestApi.Authenticator.encode_and_sign(%{id: user.id})

      Logger.info "token: " <> inspect(token)
      render(conn, "authenticated.json", %{user: user, token: token})

    else
      {:error, message} -> render(conn, "error.json", %{message: message})
    end

  end

  def sign_out(conn, _params) do
    conn
    |> Authenticator.Plug.sign_out()
    |> send_resp(204, "")
  end

end


