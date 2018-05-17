defmodule SharefestApi.People.BusinessActivitiesTest do
  use SharefestApi.DataCase

  alias SharefestApi.People.BusinessActivities

  describe "business_activities" do
    alias SharefestApi.People.BusinessActivity

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def business_activity_fixture(attrs \\ %{}) do
      {:ok, business_activity} =
        attrs
        |> Enum.into(@valid_attrs)
        |> BusinessActivities.create_business_activity()

      business_activity
    end

    test "list_business_activities/0 returns all business_activities" do
      business_activity = business_activity_fixture()
      assert BusinessActivities.list_business_activities() == [business_activity]
    end

    test "get_business_activity!/1 returns the business_activity with given id" do
      business_activity = business_activity_fixture()
      assert BusinessActivities.get_business_activity!(business_activity.id) == business_activity
    end

    test "create_business_activity/1 with valid data creates a business_activity" do
      assert {:ok, %BusinessActivity{} = business_activity} = BusinessActivities.create_business_activity(@valid_attrs)
      assert business_activity.name == "some name"
    end

    test "create_business_activity/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = BusinessActivities.create_business_activity(@invalid_attrs)
    end

    test "update_business_activity/2 with valid data updates the business_activity" do
      business_activity = business_activity_fixture()
      assert {:ok, business_activity} = BusinessActivities.update_business_activity(business_activity, @update_attrs)
      assert %BusinessActivity{} = business_activity
      assert business_activity.name == "some updated name"
    end

    test "update_business_activity/2 with invalid data returns error changeset" do
      business_activity = business_activity_fixture()
      assert {:error, %Ecto.Changeset{}} = BusinessActivities.update_business_activity(business_activity, @invalid_attrs)
      assert business_activity == BusinessActivities.get_business_activity!(business_activity.id)
    end

    test "change_business_activity/1 returns a business_activity changeset" do
      business_activity = business_activity_fixture()
      assert %Ecto.Changeset{} = BusinessActivities.change_business_activity(business_activity)
    end
  end
end
