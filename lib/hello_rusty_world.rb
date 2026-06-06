# frozen_string_literal: true

module HelloRustyWorld
  class Error < StandardError; end

  class << self
  
    def load_native_extension
      @native_enabled = true
      ruby_api_ver = RbConfig::CONFIG.fetch("ruby_version").split(".", 3)[0, 2].join(".")
      require_relative "hello_rusty_world/#{ruby_api_ver}/hello_rusty_world"    
    rescue LoadError
      require_relative "hello_rusty_world/hello_rusty_world"    
    rescue LoadError
      @native_enabled = false
    end

    def native_enabled?
      @native_enabled == true
    end
  end
  private_class_method :load_native_extension
end

HelloRustyWorld.send(:load_native_extension)
require_relative "hello_rusty_world/version"
require "hello_rusty_world/greeting"
