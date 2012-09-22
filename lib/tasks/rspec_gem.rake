# encoding: utf-8
require "logger"
namespace RspecGem.name_of_gem do
  desc "testing gem #{RspecGem.name_of_gem.clone}"
  task :rspec do
    arg = ARGV.last
    task arg.to_sym do ; end
    command = "rspec #{File.expand_path(arg, RspecGem.path)}".clone
    Logger.new(STDOUT).info command
    system(command)
  end
end
