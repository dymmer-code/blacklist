defmodule Blacklist.Tesla.Akismet do
  @moduledoc """
  HTTP client for Akismet.
  """

  use Tesla, only: [:get, :post], docs: false

  plug Tesla.Middleware.BaseUrl, get_url()
  plug Tesla.Middleware.FormUrlencoded

  @default_comment_type "contact-form"

  defp cfg(key), do: Application.get_env(:blacklist, key, [])

  defp get_url, do: "https://#{cfg(:api_key)}.rest.akismet.com"

  def comment_check(author, email, locale, user_agent, user_ip, content,
                    comment_type \\ @default_comment_type) do
    res = post("/1.1/comment-check", %{
      blog: cfg(:blog),
      permalink: cfg(:blog),
      is_test: Mix.env() in [:test, :dev],
      blog_charset: "UTF-8",
      blog_lang: locale,
      comment_content: content,
      comment_author: author,
      comment_author_email: email,
      comment_type: comment_type,
      user_agent: user_agent,
      user_ip: user_ip
    })
    case res do
      {:ok, resp} ->
        case resp.body do
          "false" -> false
          "true" -> true
          error -> {:error, "unknown response from Akismet: #{inspect error}"}
        end
      {:error, _} = error -> error
    end
  end
end
