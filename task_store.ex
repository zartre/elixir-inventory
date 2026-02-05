defmodule TaskStore do
  use GenServer

  # --- Client API (The stuff you call) ---

  def start_link do
    GenServer.start_link(__MODULE__, %{}, name: :task_store)
  end

  def create(id, task_data), do: GenServer.call(:task_store, {:create, id, task_data})
  def read(id),              do: GenServer.call(:task_store, {:read, id})
  def update(id, task_data), do: GenServer.call(:task_store, {:update, id, task_data})
  def delete(id),            do: GenServer.call(:task_store, {:delete, id})

  # --- Server Callbacks (The logic) ---

  @impl true
  def init(initial_state), do: {:ok, initial_state}

  @impl true
  def handle_call({:create, id, data}, _from, state) do
    new_state = Map.put(state, id, data)
    {:reply, :ok, new_state}
  end

  @impl true
  def handle_call({:read, id}, _from, state) do
    {:reply, Map.get(state, id, :not_found), state}
  end

  @impl true
  def handle_call({:update, id, data}, _from, state) do
    if Map.has_key?(state, id) do
      {:reply, :ok, Map.put(state, id, data)}
    else
      {:reply, :error_not_found, state}
    end
  end

  @impl true
  def handle_call({:delete, id}, _from, state) do
    {:reply, :ok, Map.delete(state, id)}
  end
end
