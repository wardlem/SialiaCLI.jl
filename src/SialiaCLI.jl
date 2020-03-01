module SialiaCLI

using ArgParse

include("./DockerUtils.jl")
include("./Generator.jl")
include("./Builder.jl")
include("./Runner.jl")
include("./Deployer.jl")

function julia_main()::Cint
  try
    real_main()
  catch
      Base.invokelatest(Base.display_error, Base.catch_stack())
      return 1
  end
  return 0
end

function real_main()
  parsed_args = parse_cli_args()

  if parsed_args[:_COMMAND_] == :build
    Builder.execute(parsed_args)
  elseif parsed_args[:_COMMAND_] == :generate
    Generator.execute(parsed_args)
  elseif parsed_args[:_COMMAND_] == :run
    Runner.execute(parsed_args)
  elseif parsed_args[:_COMMAND_] == :deploy
    Deployer.execute(parsed_args)
  end
end

include("./parseargs.jl")

if abspath(PROGRAM_FILE) == @__FILE__
  real_main()
end

end # module