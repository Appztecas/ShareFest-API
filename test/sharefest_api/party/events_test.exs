defmodule SharefestApi.Party.EventsTest do
  use SharefestApi.DataCase

  alias SharefestApi.Party.Events

  describe "events" do
    alias SharefestApi.Party.Event

    @valid_attrs %{
      address: "some address",
      description: "some description",
      invitation_uri: "some invitation_uri",
      latitude: "some latitude",
      longitude: "some longitude",
      name: "some name",
      start_date: ~D[2010-04-17]
    }
    @update_attrs %{
      address: "some updated address",
      description: "some updated description",
      invitation_uri: "some updated invitation_uri",
      latitude: "some updated latitude",
      longitude: "some updated longitude",
      name: "some updated name",
      start_date: ~D[2011-05-18]
    }
    @invalid_attrs %{
      address: nil,
      description: nil,
      invitation_uri: nil,
      latitude: nil,
      longitude: nil,
      name: nil,
      start_date: nil
    }

    def event_fixture(attrs \\ %{}) do
      {:ok, event} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Events.create_event()

      event
    end

    test "list_events/0 returns all events" do
      event = event_fixture()
      assert Events.list_events() == [event]
    end

    test "get_event!/1 returns the event with given id" do
      event = event_fixture()
      assert Events.get_event!(event.id) == event
    end

    test "create_event/1 with valid data creates a event" do
      assert {:ok, %Event{} = event} = Events.create_event(@valid_attrs)
      assert event.address == "some address"
      assert event.description == "some description"
      assert event.invitation_uri == "some invitation_uri"
      assert event.latitude == "some latitude"
      assert event.longitude == "some longitude"
      assert event.name == "some name"
      assert event.start_date == ~D[2010-04-17]
    end

    test "create_event/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Events.create_event(@invalid_attrs)
    end

    test "update_event/2 with valid data updates the event" do
      event = event_fixture()
      assert {:ok, event} = Events.update_event(event, @update_attrs)
      assert %Event{} = event
      assert event.address == "some updated address"
      assert event.description == "some updated description"
      assert event.invitation_uri == "some updated invitation_uri"
      assert event.latitude == "some updated latitude"
      assert event.longitude == "some updated longitude"
      assert event.name == "some updated name"
      assert event.start_date == ~D[2011-05-18]
    end

    test "update_event/2 with invalid data returns error changeset" do
      event = event_fixture()
      assert {:error, %Ecto.Changeset{}} = Events.update_event(event, @invalid_attrs)
      assert event == Events.get_event!(event.id)
    end

    test "delete_event/1 deletes the event" do
      event = event_fixture()
      assert {:ok, %Event{}} = Events.delete_event(event)
      assert_raise Ecto.NoResultsError, fn -> Events.get_event!(event.id) end
    end

    test "change_event/1 returns a event changeset" do
      event = event_fixture()
      assert %Ecto.Changeset{} = Events.change_event(event)
    end
  end
end
