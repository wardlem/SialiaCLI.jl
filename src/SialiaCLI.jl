module SialiaCLI

using ArgParse

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
  # @show ARGS
  # @show Base.PROGRAM_FILE
  # @show DEPOT_PATH
  # @show LOAD_PATH
  # @show pwd()
  # @show Base.active_project()
  # @show Threads.nthreads()
  # @show Sys.BINDIR
  # display(Base.loaded_modules)
  # println("")
  parsed_args = parse_cli_args()
  println("Parsed args:")
  for (arg,val) in parsed_args
      println("  $arg  =>  $val")
  end
end

include("./parseargs.jl")

if abspath(PROGRAM_FILE) == @__FILE__
  real_main()
end

end # module