defmodule SharefestApi.People.Users do
  @moduledoc """
  The People context.
  """

  import Ecto.Query, warn: false
  alias SharefestApi.Repo

  alias SharefestApi.People.User
  alias Comeonin.Bcrypt

  @doc """
  Returns the list of user.

  ## Examples

      iex> list_user()
      [%User{}, ...]

  """
  def list_user do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Searches for a user with a social network
  """
  def authenticate_user(username, identifier, :facebook) do
    User
    |> where([u], (u.phone == ^username or u.email == ^username) and u.facebook_id == ^identifier)
    |> Repo.one
    |> case do
         nil -> {:error, "No se encontro un usuario con esa red social"}
         user -> {:ok, user}
       end
  end

  def authenticate_user(username, identifier, :amazon) do
    User
    |> where([u], (u.phone == ^username or u.email == ^username) and u.amazon_id == ^identifier)
    |> Repo.one
    |> case do
         nil -> {:error, "No se encontro un usuario con esa red social"}
         user -> {:ok, user}
       end
  end

  @doc """
  Searches the database for a user with the matching username, then
  checks that encrypting the plain text password matches in the
  encrypted password that was stored during user creation.
  """
  def authenticate_user(username, plain_password, :password) do

    User
    |> where([u], (u.phone == ^username or u.email == ^username))
    |> Repo.one
    |> check_password(plain_password)
  end

  defp check_password(nil, _), do: {:error, "Usuario o contraseña incorrecto"}
  defp check_password(user, plain_text_password) do
    case Bcrypt.checkpw(plain_text_password, user.password) do
      true -> {:ok, user}
      false -> {:error, "Usuario o contraseña incorrecto"}
    end
  end

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end
end
