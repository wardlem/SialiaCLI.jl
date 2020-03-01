module DockerUtils

import HTTP
import JSON

export check_if_docker_installed
export install_docker
export check_if_snap_installed

function check_installation(program::String)
  print("Checking if $program is installed...")
  command = Cmd(`which $program`, ignorestatus=true)
  output = try
    read(command, String)
  catch e
    dump(e)
    ""
  end

  is_installed = output != ""
  println(is_installed ? "installed" : "not installed")
  is_installed
end

function check_if_docker_installed()
  check_installation("docker")
end

function check_if_snap_installed()
  check_installation("snap")
end

function install_docker()
  # TODO: Don't do this in production mode
  print("Docker is not currently installed.  Would you like to install it now? (y/n): ")
  do_install = false
  while true
    answer = readline()
    answer = lowercase(answer)
    if answer == "yes" || answer == "y"
      do_install = true
      break
    elseif answer == "no" || answer == "n"
      do_install = false
      break
    else
      print("Please enter y or n")
    end
  end

  if !do_install
    println("Skipping docker installation")
    return false
  end

  println("Docker will be installed")
  if !check_if_snap_installed()
    println("Automatic docker cannot be performed")
    if Sys.KERNEL == :Linux
      println("The recommended method for installing docker on Linux is to use snap.")
      println("Go to https://snapcraft.io/docs/installing-snapd for instructions on how to install snap and run this command again.")
    else
      println("Visit https://docs.docker.com/install/ for instructions on how to install the docker engine on your system")
    end

    return false
  end

  command = Cmd(`sudo snap install docker`)
  try
    read(command, String)
  catch e
    println("The docker installation failed")
    return false
  end

  true
end

end # module