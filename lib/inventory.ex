# Represents a minimal in-memory inventory management system.

defmodule Inventory do
  use Agent

  # Public API

  @doc """
  Starts the inventory agent with an empty state.
  """
  def start_link(initial_state \ %{}) do
    Agent.start_link(fn -> initial_state end, name: __MODULE__)
  end

  @doc """
  Lists all items in the inventory.
  """
  def list_items do
    Agent.get(__MODULE__, fn state -> state end)
  end

  @doc """
  Adds an item to the inventory.
  """
  def add_item(item, quantity) do
    Agent.update(__MODULE__, fn state -> Map.put(state, item, quantity) end)
  end

  @doc """
  Removes an item from the inventory.
  """
  def remove_item(item) do
    Agent.update(__MODULE__, fn state -> Map.delete(state, item) end)
  end

  @doc """
  Gets the quantity of a specific item.
  """
  def get_quantity(item) do
    Agent.get(__MODULE__, fn state -> Map.get(state, item, 0) end)
  end
end
