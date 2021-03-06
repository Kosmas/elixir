defmodule Mix.Tasks.Archive.Uninstall do
  use Mix.Task

  @shortdoc "Uninstall archives"

  @moduledoc """
  Uninstall local archives:

      mix archive.uninstall archive.ez

  """

  def run(argv) do
    {_, argv, _} = OptionParser.parse(argv)

    if name = List.first(argv) do
      path = Path.join(Mix.Local.archives_path, name)
      if File.regular?(path) do
        File.rm!(path)
      else
        Mix.shell.error "Could not find a local archive named #{inspect name}. "<>
                        "Existing archives are:"
        Mix.Task.run "archive"
      end
    else
      Mix.raise "No archive was given to uninstall"
    end
  end
end
