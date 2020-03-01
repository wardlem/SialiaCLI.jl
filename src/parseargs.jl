function parse_cli_args()

  settings = ArgParseSettings(prog="sialia",
    description="Command line tools for the Sialia framework",
    add_version=true)
      
  @add_arg_table! settings begin
    "generate", "gen"
      help = "Create a new Sialia project, service, or infrastructure definition"
      action = :command
    "build"
      help = "Build the project"
      action = :command
    "run"
      help = "Run the project"
      action = :command
    "deploy"
      help = "Deploy the project"
      action = :command
  end

  @add_arg_table! settings["generate"] begin
    "project"
      help = "Create a new Sialia project"
      action = :command
    "service"
      help = "Create a service in an existing Sialia project"
      action = :command
    "infrastructure"
      help = "Create a new infrastructure definition in an existing Sialia project"
      action = :command
  end

  @add_arg_table! settings["build"] begin
    # Empty for now
  end

  @add_arg_table! settings["run"] begin
    # Empty for now
  end

  @add_arg_table! settings["deploy"] begin
    # Empty for now
  end

  return parse_args(settings, as_symbols=true)

end

