defmodule SharefestApi.Catalogue.ExperiencesTest do
  use SharefestApi.DataCase

  alias SharefestApi.Catalogue.Experiences

  describe "experiences" do
    alias SharefestApi.Catalogue.Experience

    @valid_attrs %{
      description: "some description",
      name: "some name",
      status: true,
      uri_image: "some uri_image"
    }
    @update_attrs %{
      description: "some updated description",
      name: "some updated name",
      status: false,
      uri_image: "some updated uri_image"
    }
    @invalid_attrs %{description: nil, name: nil, status: nil, uri_image: nil}

    def experience_fixture(attrs \\ %{}) do
      {:ok, experience} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Experiences.create_experience()

      experience
    end

    test "list_experiences/0 returns all experiences" do
      experience = experience_fixture()
      assert Experiences.list_experiences() == [experience]
    end

    test "get_experience!/1 returns the experience with given id" do
      experience = experience_fixture()
      assert Experiences.get_experience!(experience.id) == experience
    end

    test "create_experience/1 with valid data creates a experience" do
      assert {:ok, %Experience{} = experience} = Experiences.create_experience(@valid_attrs)
      assert experience.description == "some description"
      assert experience.name == "some name"
      assert experience.status == true
      assert experience.uri_image == "some uri_image"
    end

    test "create_experience/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Experiences.create_experience(@invalid_attrs)
    end

    test "update_experience/2 with valid data updates the experience" do
      experience = experience_fixture()
      assert {:ok, experience} = Experiences.update_experience(experience, @update_attrs)
      assert %Experience{} = experience
      assert experience.description == "some updated description"
      assert experience.name == "some updated name"
      assert experience.status == false
      assert experience.uri_image == "some updated uri_image"
    end

    test "update_experience/2 with invalid data returns error changeset" do
      experience = experience_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Experiences.update_experience(experience, @invalid_attrs)

      assert experience == Experiences.get_experience!(experience.id)
    end

    test "delete_experience/1 deletes the experience" do
      experience = experience_fixture()
      assert {:ok, %Experience{}} = Experiences.delete_experience(experience)
      assert_raise Ecto.NoResultsError, fn -> Experiences.get_experience!(experience.id) end
    end

    test "change_experience/1 returns a experience changeset" do
      experience = experience_fixture()
      assert %Ecto.Changeset{} = Experiences.change_experience(experience)
    end
  end
end
