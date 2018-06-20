defmodule SharefestApi.Authenticator do
  @moduledoc """
  This module encapsulates the implementation of
  Guardian Authentication Plugin
  """
  use Guardian, otp_app: :sharefest_api

  def subject_for_token(user, _claims) do
    IO.puts "user"
    IO.inspect user

    {:ok, to_string(user.id)}
  end
  # def resource_from_claims(claims) do
  #   user = claims["sub"]
  #   |> Admin.get_user!
  #   {:ok, user}
  #   # If something goes wrong here return {:error, reason}
  # end

  def subject_for_token(_, _) do
    {:error, :reason_for_error}
  end

  def resource_from_claims(claims) do
    # Here we'll look up our resource from the claims, the subject can be
    # found in the `"sub"` key. In `above subject_for_token/2` we returned
    # the resource id so here we'll rely on that to look it up.
    id = claims["sub"]
    resource = SharefestApi.get_resource_by_id(id)
    {:ok,  resource}
  end
  def resource_from_claims(_claims) do
    {:error, :reason_for_error}
  end

end
