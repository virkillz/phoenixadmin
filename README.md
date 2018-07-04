# Phoenixadmin

Many project require admin panel. This is a simple boilerplate for admin panel using phoenix. It already have user authentication. And modified HTML generator to make it slightly nicer. It can save me several hour everytime I need to do admin portal.

![Screenshot](https://s33.postimg.cc/4h4nkj89b/Screen_Shot_2018-07-04_at_2.49.57_PM.png)

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Check your database setting at `config/dev.exs` and match your postgresql credential
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Run seed `mix run priv/repo/seeds.exs` (if you are from asset folder, dont forget to back to root project folder `cd ..`)
  * Start Phoenix endpoint with `mix phx.server`
  * Login with username 'administrator' and passsword 'administrator'

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.


How 