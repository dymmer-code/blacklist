defmodule Blacklist do
  require Logger
  alias Blacklist.Tesla.Akismet

  def check(name, email, locale, user_agent, ip, data) do
    check_blacklist("name", name) or
    check_blacklist("email", email) or
    check_akismet(name, email, locale, user_agent, ip, data)
  end

  defp check_blacklist(name, data) do
    blacklist = Application.get_env(:tesla_akismet, :blacklist, [])
    check = fn(r) ->
      {:ok, re} = Regex.compile(r)
      Regex.match? re, data
    end
    Enum.any?(blacklist[name], check)
  end

  defp check_akismet(name, email, locale, user_agent, ip, data) do
    case Akismet.comment_check(name, email, locale, user_agent, ip, data) do
      false -> false
      true ->
        Logger.info "[spam] check #{name} <#{email}> (#{ip}): #{data}"
        true
      nil ->
        Logger.error "[discard] check #{name} <#{email}> (#{ip}): #{data}"
        true
    end
  end
end
