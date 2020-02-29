using PackageCompiler

# TODO: Compile into a version
# TODO: Make sure we are in the correct directory

create_app("./", "./build/Sialia", force=true, incremental=false, filter_stdlibs=true)