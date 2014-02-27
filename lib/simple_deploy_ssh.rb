class SimpleDeploySSH
  VERSION = "0.0.2"

  def initialize(env_name, stack_name, instance_name)
    @env_name      = env_name
    @stack_name    = stack_name
    @instance_name = instance_name
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
    fsn = list.find { |line| line.match /-\d-#@stack_name-\d-#@instance_name-\d/ }
    raise "instance not found" if fsn.nil?
    fsn
  end

  def ip
    command = "simple_deploy instances -e #@env_name -n #{full_stack_name}"
    `#{command}`.split.first
  end

  def ssh_command
    "ssh #{ip}"
  end
end
