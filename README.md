# Elixir Inventory Management System

This project demonstrates how functional programming concepts in Elixir can be applied to a real-world application—a minimalist inventory management system.

## Features
- In-memory inventory store for managing items
- Functional programming paradigms
- Simple API to list, add, remove, and get item quantities

## Prerequisites
- Docker (if you want to use containerization)
- Elixir (if you wish to run the app locally)

## Running the Application

### Using Docker
1. Build the Docker image:

   ```sh
   docker build -t elixir-inventory .
   ```

2. Start a container:

   ```sh
   docker run -it elixir-inventory
   ```

### Run Locally
1. Install dependencies using:

   ```sh
   mix deps.get
   ```

2. Start the application in the interactive shell:

   ```sh
   iex -S mix
   ```

## Usage

- Start the inventory agent:

  ```elixir
  Inventory.start_link(%{})
  ```

- Add an item:

  ```elixir
  Inventory.add_item("apple", 10)
  ```

- List all items:

  ```elixir
  Inventory.list_items()
  ```

- Remove an item:

  ```elixir
  Inventory.remove_item("apple")
  ```

- Get the quantity of a specific item:

  ```elixir
  Inventory.get_quantity("apple")
  ```

## License
MIT
