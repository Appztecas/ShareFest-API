defmodule SharefestApi.Authenticator do
  @moduledoc """
  This module encapsulates the implementation of
  Guardian Authentication Plugin
  """
  use Guardian, otp_app: :sharefest_api

  def subject_for_token(user, _claims) do
    {:ok, to_string(user.id)}
  end
  # def resource_from_claims(claims) do
  #   user = claims["sub"]
  #   |> Admin.get_user!
  #   {:ok, user}
  #   # If something goes wrong here return {:error, reason}
  # end

  def subject_for_token(resource, _claims) do
    # You can use any value for the subject of your token but
    # it should be useful in retrieving the resource later, see
    # how it being used on `resource_from_claims/1` function.
    # A unique `id` is a good subject, a non-unique email address
    # is a poor subject.
    sub = to_string(resource.id)
    {:ok, sub}
  end

end
