module Cora
  autoload :Repository, 'cora/repository'
  autoload :Configuration, 'cora/configuration'

  def self.table_name_prefix
    'cora_'
  end

  def self.config
    @config ||= Cora::Configuration.new
  end

  def self.configure
    yield config if block_given?
  end

  def self.repository
    @repository ||= config.repository_class.new
  end
end

Cora.configure do |config|
  config.autocreate = false
  config.repository_class = Cora::Repository
end
