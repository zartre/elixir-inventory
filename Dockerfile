# Dockerfile to run the Elixir Inventory Management System

FROM elixir:1.14

# Set the working directory
WORKDIR /app

# Install Hex, Rebar, and application dependencies
RUN mix local.hex --force && \
    mix local.rebar --force

# Copy the code into the Docker container
COPY . .

# Install dependencies
RUN mix deps.get

# Specify the default command to run the Elixir interactive shell
CMD ["iex", "-S", "mix"]
