# Blacklist

[![hex.pm](https://img.shields.io/hexpm/v/blacklist.svg)](https://hex.pm/packages/blacklist)
[![hexdocs.pm](https://img.shields.io/badge/hex-docs-lightgreen.svg)](https://hexdocs.pm/blacklist/)
[![hex.pm](https://img.shields.io/hexpm/dt/blacklist.svg)](https://hex.pm/packages/blacklist)
[![hex.pm](https://img.shields.io/hexpm/l/blacklist.svg)](https://hex.pm/packages/blacklist)
[![github.com](https://img.shields.io/github/last-commit/dymmer-code/blacklist.svg)](https://github.com/dymmer-code/blacklist/commits/master)

Blacklist check with [Akismet API](https://akismet.com/development/api/#comment-check) implemented with [Tesla](https://hex.pm/packages/tesla).

This is very useful to check if a message coming from a contact form is a _ham_ or _spam_ one.

## Installation

Add `blacklist` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:blacklist, "~> 0.1"}
  ]
end
```

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
