import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :issue_1969_web, Issue1969Web.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "EFAWhnmqgvnM6bF3itjulNjIKzLDaYcm9zGfqj6+xdGbRci0m8jd1akOeERaB9ob",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
