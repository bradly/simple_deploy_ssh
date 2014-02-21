class SimpleDeploySSH
  VERSION = "0.0.1"

  def initialize(env_name, stack_name)
    @env_name   = env_name
    @stack_name = stack_name
  end

  def connect!
    Kernel.exec ssh_command
  end

  private
  def list
    command = "simple_deploy list -e #@env_name"
    `#{command}`.split
  end

  def full_stack_name
    fsn = list.find { |line| line.match /-\d-#@env_name-\d-#@stack_name-\d/ }
    raise "stack not found" if fsn.nil?
    fsn
  end

  def ip
    command = "simple_deploy instances -e #@env_name -n #{full_stack_name}"
    `#{command}`
  end

  def ssh_command
    "ssh #{ip}"
  end
end
