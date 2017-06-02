defmodule Rumbl.User do
  use Rumbl.Web, :model

  # Macro that creates a struct, use %Rumbl.User{}
  schema "users" do
    field :name, :string
    field :username, :string
    field :password, :string, virtual: true # not persisted in DB
    field :password_hash, :string

    timestamps()
  end

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, ~w(name username))
    |> validate_required([:name, :username])
    |> validate_length(:username, min: 1, max: 20)
  end
end
