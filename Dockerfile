# Use the official Elixir image (Alpine version is tiny)
FROM elixir:1.15-alpine

# Create a directory for the app
WORKDIR /app

# Copy your script into the container
COPY task_store.ex .

# Since we aren't using a full project, we can't use 'mix'
# We'll use 'elixirc' to compile the file so it's ready to go
RUN elixirc task_store.ex

# To keep the container running, we need to start the process.
# Since it's a GenServer, we'll run an Elixir command that
# starts the store and then stays alive.
CMD ["elixir", "-e", "TaskStore.start_link(); Process.sleep(:infinity)"]
