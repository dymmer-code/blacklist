# TeslaAkismet

Implementation for the API available in this site: https://akismet.com/development/api/#comment-check

This uses [Tesla]() library to make easier the access to the endpoint.

This is very useful to check if a message coming from a contact form is a _ham_ or _spam_ one.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `currency_convert_api` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:tesla_akismet, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/currency_convert_api](https://hexdocs.pm/currency_convert_api).

## Usage

```elixir
TeslaAkismet.comment_check author, email, locale, user_agent, user_ip, content
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
config :tesla_akismet, api_key: "xxxxxxxxxxxx"
```

You can use also the configuration to use a custom blacklist through the module `TeslaAkismet.Blacklist`. This module has only one function to check the information against the blacklist configuration and if it's ok, then against the akismet service.

The configuration for the blacklist is as follow:

```elixir
config :tesla_akismet, :blacklist,
  name: [],
  email: ["@mail.ru", "@plusgmail.ru", "@seocdvig.ru"]
```

Enjoy!
