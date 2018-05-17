defmodule SharefestApi.People.BusinessActivities do
  @moduledoc """
  The Business Activities context.
  """

  import Ecto.Query, warn: false
  alias SharefestApi.Repo

  alias SharefestApi.People.BusinessActivity

  @doc """
  Returns the list of business_activities.

  ## Examples

      iex> list_business_activities()
      [%BusinessActivity{}, ...]

  """
  def list_business_activities do
    Repo.all(BusinessActivity)
  end

  @doc """
  Gets a single business_activity.

  Raises `Ecto.NoResultsError` if the Business activity does not exist.

  ## Examples

      iex> get_business_activity!(123)
      %BusinessActivity{}

      iex> get_business_activity!(456)
      ** (Ecto.NoResultsError)

  """
  def get_business_activity!(id), do: Repo.get!(BusinessActivity, id)

  @doc """
  Creates a business_activity.

  ## Examples

      iex> create_business_activity(%{field: value})
      {:ok, %BusinessActivity{}}

      iex> create_business_activity(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_business_activity(attrs \\ %{}) do
    %BusinessActivity{}
    |> BusinessActivity.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a business_activity.

  ## Examples

      iex> update_business_activity(business_activity, %{field: new_value})
      {:ok, %BusinessActivity{}}

      iex> update_business_activity(business_activity, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_business_activity(%BusinessActivity{} = business_activity, attrs) do
    business_activity
    |> BusinessActivity.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking business_activity changes.

  ## Examples

      iex> change_business_activity(business_activity)
      %Ecto.Changeset{source: %BusinessActivity{}}

  """
  def change_business_activity(%BusinessActivity{} = business_activity) do
    BusinessActivity.changeset(business_activity, %{})
  end
end
