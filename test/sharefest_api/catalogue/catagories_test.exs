defmodule SharefestApi.CatalogueTest do
  use SharefestApi.DataCase

  alias SharefestApi.Catalogue.Categories

  describe "categories" do
    alias SharefestApi.Catalogue.Category

    @valid_attrs %{
      external_id: "some external_id",
      name: "some name",
      uri_image: "some uri_image"
    }
    @update_attrs %{
      external_id: "some updated external_id",
      name: "some updated name",
      uri_image: "some updated uri_image"
    }
    @invalid_attrs %{external_id: nil, name: nil, uri_image: nil}

    def category_fixture(attrs \\ %{}) do
      {:ok, category} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Categories.create_category()

      category
    end

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert Categories.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Categories.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      assert {:ok, %Category{} = category} = Categories.create_category(@valid_attrs)
      assert category.external_id == "some external_id"
      assert category.name == "some name"
      assert category.uri_image == "some uri_image"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Categories.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      assert {:ok, category} = Categories.update_category(category, @update_attrs)
      assert %Category{} = category
      assert category.external_id == "some updated external_id"
      assert category.name == "some updated name"
      assert category.uri_image == "some updated uri_image"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Categories.update_category(category, @invalid_attrs)
      assert category == Categories.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Categories.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Categories.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Categories.change_category(category)
    end
  end
end
