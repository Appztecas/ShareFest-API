defmodule SharefestApi.Catalogue.ExperienceProducts do
  @moduledoc """
  The Catalogue context for Experience products
  """

  import Ecto.Query, warn: false
  alias SharefestApi.Repo

  alias SharefestApi.Catalogue.ExperienceProduct

  @doc """
  Returns the list of experience_products.

  ## Examples

  iex> list_experience_products()
  [%ExperienceProduct{}, ...]

  """
  def list_experience_products(experience_id) do
    ExperienceProduct
    |> where([e], e.experience_id == ^experience_id)
    |> Repo.all
  end

  @doc """
  Gets a single experience_product.

  Raises `Ecto.NoResultsError` if the Experience  product does not exist.

  ## Examples

      iex> get_experience_product!(123)
      %ExperienceProduct{}

      iex> get_experience_product!(456)
      ** (Ecto.NoResultsError)

  """
  def get_experience_product!(id), do: Repo.get!(ExperienceProduct, id)

  @doc """
  Creates a experience_product.

  ## Examples

      iex> create_experience_product(%{field: value})
      {:ok, %ExperienceProduct{}}

      iex> create_experience_product(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_experience_product(attrs \\ %{}) do
    %ExperienceProduct{}
    |> ExperienceProduct.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a experience_product.

  ## Examples

      iex> update_experience_product(experience_product, %{field: new_value})
      {:ok, %ExperienceProduct{}}

      iex> update_experience_product(experience_product, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_experience_product(%ExperienceProduct{} = experience_product, attrs) do
    experience_product
    |> ExperienceProduct.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ExperienceProduct.

  ## Examples

      iex> delete_experience_product(experience_product)
      {:ok, %ExperienceProduct{}}

      iex> delete_experience_product(experience_product)
      {:error, %Ecto.Changeset{}}

  """
  def delete_experience_product(%ExperienceProduct{} = experience_product) do
    Repo.delete(experience_product)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking experience_product changes.

  ## Examples

      iex> change_experience_product(experience_product)
      %Ecto.Changeset{source: %ExperienceProduct{}}

  """
  def change_experience_product(%ExperienceProduct{} = experience_product) do
    ExperienceProduct.changeset(experience_product, %{})
  end
end
