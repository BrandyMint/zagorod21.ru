module Cora
  class Configuration
    include ActiveSupport::Configurable

    config_accessor :autocreate
    config_accessor :repository_class
  end
end
