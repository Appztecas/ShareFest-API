defmodule SharefestApi.People.SuppliersTest do
  use SharefestApi.DataCase

  alias SharefestApi.People.Suppliers

  describe "suppliers" do
    alias SharefestApi.People.Supplier

    @valid_attrs %{
      area_of_service: "some area_of_service",
      description: "some description",
      email: "some email",
      logo: "some logo",
      name: "some name",
      phone: "some phone",
      photo: "some photo",
      social_account: "some social_account"
    }
    @update_attrs %{
      area_of_service: "some updated area_of_service",
      description: "some updated description",
      email: "some updated email",
      logo: "some updated logo",
      name: "some updated name",
      phone: "some updated phone",
      photo: "some updated photo",
      social_account: "some updated social_account"
    }
    @invalid_attrs %{
      area_of_service: nil,
      description: nil,
      email: nil,
      logo: nil,
      name: nil,
      phone: nil,
      photo: nil,
      social_account: nil
    }

    def supplier_fixture(attrs \\ %{}) do
      {:ok, supplier} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Suppliers.create_supplier()

      supplier
    end

    test "list_suppliers/0 returns all suppliers" do
      supplier = supplier_fixture()
      assert Suppliers.list_suppliers() == [supplier]
    end

    test "get_supplier!/1 returns the supplier with given id" do
      supplier = supplier_fixture()
      assert Suppliers.get_supplier!(supplier.id) == supplier
    end

    test "create_supplier/1 with valid data creates a supplier" do
      assert {:ok, %Supplier{} = supplier} = Suppliers.create_supplier(@valid_attrs)
      assert supplier.area_of_service == "some area_of_service"
      assert supplier.description == "some description"
      assert supplier.email == "some email"
      assert supplier.logo == "some logo"
      assert supplier.name == "some name"
      assert supplier.phone == "some phone"
      assert supplier.photo == "some photo"
      assert supplier.social_account == "some social_account"
    end

    test "create_supplier/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Suppliers.create_supplier(@invalid_attrs)
    end

    test "update_supplier/2 with valid data updates the supplier" do
      supplier = supplier_fixture()
      assert {:ok, supplier} = Suppliers.update_supplier(supplier, @update_attrs)
      assert %Supplier{} = supplier
      assert supplier.area_of_service == "some updated area_of_service"
      assert supplier.description == "some updated description"
      assert supplier.email == "some updated email"
      assert supplier.logo == "some updated logo"
      assert supplier.name == "some updated name"
      assert supplier.phone == "some updated phone"
      assert supplier.photo == "some updated photo"
      assert supplier.social_account == "some updated social_account"
    end

    test "update_supplier/2 with invalid data returns error changeset" do
      supplier = supplier_fixture()
      assert {:error, %Ecto.Changeset{}} = Suppliers.update_supplier(supplier, @invalid_attrs)
      assert supplier == Suppliers.get_supplier!(supplier.id)
    end

    test "delete_supplier/1 deletes the supplier" do
      supplier = supplier_fixture()
      assert {:ok, %Supplier{}} = Suppliers.delete_supplier(supplier)
      assert_raise Ecto.NoResultsError, fn -> Suppliers.get_supplier!(supplier.id) end
    end

    test "change_supplier/1 returns a supplier changeset" do
      supplier = supplier_fixture()
      assert %Ecto.Changeset{} = Suppliers.change_supplier(supplier)
    end
  end
end
