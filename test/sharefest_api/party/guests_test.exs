defmodule SharefestApi.PartyTest do
  use SharefestApi.DataCase

  alias SharefestApi.Party.Guests

  describe "guests" do
    alias SharefestApi.Party.Guest

    @valid_attrs %{email: "some email", phone: "some phone", status: "some status"}
    @update_attrs %{
      email: "some updated email",
      phone: "some updated phone",
      status: "some updated status"
    }
    @invalid_attrs %{email: nil, phone: nil, status: nil}

    def guest_fixture(attrs \\ %{}) do
      {:ok, guest} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Guests.create_guest()

      guest
    end

    test "list_guests/0 returns all guests" do
      guest = guest_fixture()
      assert Guests.list_guests() == [guest]
    end

    test "get_guest!/1 returns the guest with given id" do
      guest = guest_fixture()
      assert Guests.get_guest!(guest.id) == guest
    end

    test "create_guest/1 with valid data creates a guest" do
      assert {:ok, %Guest{} = guest} = Guests.create_guest(@valid_attrs)
      assert guest.email == "some email"
      assert guest.phone == "some phone"
      assert guest.status == "some status"
    end

    test "create_guest/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Guests.create_guest(@invalid_attrs)
    end

    test "update_guest/2 with valid data updates the guest" do
      guest = guest_fixture()
      assert {:ok, guest} = Guests.update_guest(guest, @update_attrs)
      assert %Guest{} = guest
      assert guest.email == "some updated email"
      assert guest.phone == "some updated phone"
      assert guest.status == "some updated status"
    end

    test "update_guest/2 with invalid data returns error changeset" do
      guest = guest_fixture()
      assert {:error, %Ecto.Changeset{}} = Guests.update_guest(guest, @invalid_attrs)
      assert guest == Guests.get_guest!(guest.id)
    end

    test "delete_guest/1 deletes the guest" do
      guest = guest_fixture()
      assert {:ok, %Guest{}} = Guests.delete_guest(guest)
      assert_raise Ecto.NoResultsError, fn -> Guests.get_guest!(guest.id) end
    end

    test "change_guest/1 returns a guest changeset" do
      guest = guest_fixture()
      assert %Ecto.Changeset{} = Guests.change_guest(guest)
    end
  end
end
