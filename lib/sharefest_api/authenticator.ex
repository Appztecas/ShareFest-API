defmodule SharefestApi.Authenticator do
  @moduledoc """
  This module encapsulates the implementation of
  Guardian Authentication Plugin
  """
  use Guardian, otp_app: :sharefest_api

  def subject_for_token(user, _claims) do

    {:ok, to_string(user.id)}
  end

  def subject_for_token(_, _) do
    {:error, :reason_for_error}
  end

  def resource_from_claims(claims) do
    id = claims["sub"]
    resource = SharefestApi.People.Users.get_user!(id)
    {:ok,  resource}
  end

  def resource_from_claims(_claims) do
    {:error, :reason_for_error}
  end
end
