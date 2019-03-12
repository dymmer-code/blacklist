# Blacklist

Implementation for the API available in this site: https://akismet.com/development/api/#comment-check

This uses [Tesla]() library to make easier the access to the endpoint.

This is very useful to check if a message coming from a contact form is a _ham_ or _spam_ one.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `blacklist` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:blacklist, "~> 0.1"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/blacklist](https://hexdocs.pm/blacklist).

## Usage

```elixir
Blacklist.check author, email, locale, user_agent, user_ip, content
# false
```

The information provided to check if the message is spam is as follow:

- `author`: author name of the message.
- `email`: email for the author of the message.
- `locale`: language used for the message. It should be in ISO-639 (es, en, ...).
- `user_agent`: the user agent of the browser used to send the message.
- `user_ip`: the user IP where the message came from.
- `content`: the content of the message.

The result of the function will be or a boolean indicating if it's spam or not, or an error in case something went wrong.

This depends on an external service and you should to configure the credentials to use it:

```elixir
config :blacklist, api_key: "xxxxxxxxxxxx",
                   blog: "https://..."
```

The values are:

- `api_key`: the API key provided by Akismet website.
- `blog`: the URL of your website.

You can use also the configuration to use a custom blacklist. The configuration for the blacklist is as follow (you can merge both configurations to generate only one):

```elixir
config :blacklist, name: [],
                   email: ["@mail.ru", "@plusgmail.ru", "@seocdvig.ru"]
```

Enjoy!
