# encoding: utf-8

require "logger"

namespace RspecGem.name_of_gem do
  desc "testing gem #{RspecGem.name_of_gem}"
  task :rspec, :arg do |key, element|
    log = Logger.new(STDOUT)
    log.info `rspec #{File.expand_path("../../" + element[:arg], RspecGem.path)}`
  end
end
