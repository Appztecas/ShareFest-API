defmodule SharefestApi.Catalogue.ExperienceProductsTest do
  use SharefestApi.DataCase

  alias SharefestApi.Catalogue.ExperienceProducts

  describe "experience_products" do
    alias SharefestApi.Catalogue.ExperienceProduct

    @valid_attrs %{
      description: "some description",
      name: "some name",
      price: 120.5,
      uri_image: "some uri_image"
    }
    @update_attrs %{
      description: "some updated description",
      name: "some updated name",
      price: 456.7,
      uri_image: "some updated uri_image"
    }
    @invalid_attrs %{description: nil, name: nil, price: nil, uri_image: nil}

    def experience_product_fixture(attrs \\ %{}) do
      {:ok, experience_product} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ExperienceProducts.create_experience_product()

      experience_product
    end

    test "list_experience_products/0 returns all experience_products" do
      experience_product = experience_product_fixture()
      assert ExperienceProducts.list_experience_products() == [experience_product]
    end

    test "get_experience_product!/1 returns the experience_product with given id" do
      experience_product = experience_product_fixture()

      assert ExperienceProducts.get_experience_product!(experience_product.id) ==
               experience_product
    end

    test "create_experience_product/1 with valid data creates a experience_product" do
      assert {:ok, %ExperienceProduct{} = experience_product} =
               ExperienceProducts.create_experience_product(@valid_attrs)

      assert experience_product.description == "some description"
      assert experience_product.name == "some name"
      assert experience_product.price == 120.5
      assert experience_product.uri_image == "some uri_image"
    end

    test "create_experience_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} =
               ExperienceProducts.create_experience_product(@invalid_attrs)
    end

    test "update_experience_product/2 with valid data updates the experience_product" do
      experience_product = experience_product_fixture()

      assert {:ok, experience_product} =
               ExperienceProducts.update_experience_product(experience_product, @update_attrs)

      assert %ExperienceProduct{} = experience_product
      assert experience_product.description == "some updated description"
      assert experience_product.name == "some updated name"
      assert experience_product.price == 456.7
      assert experience_product.uri_image == "some updated uri_image"
    end

    test "update_experience_product/2 with invalid data returns error changeset" do
      experience_product = experience_product_fixture()

      assert {:error, %Ecto.Changeset{}} =
               ExperienceProducts.update_experience_product(experience_product, @invalid_attrs)

      assert experience_product ==
               ExperienceProducts.get_experience_product!(experience_product.id)
    end

    test "delete_experience_product/1 deletes the experience_product" do
      experience_product = experience_product_fixture()

      assert {:ok, %ExperienceProduct{}} =
               ExperienceProducts.delete_experience_product(experience_product)

      assert_raise Ecto.NoResultsError, fn ->
        ExperienceProducts.get_experience_product!(experience_product.id)
      end
    end

    test "change_experience_product/1 returns a experience_product changeset" do
      experience_product = experience_product_fixture()
      assert %Ecto.Changeset{} = ExperienceProducts.change_experience_product(experience_product)
    end
  end
end
