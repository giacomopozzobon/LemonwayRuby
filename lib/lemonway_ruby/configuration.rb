module LemonwayRuby
  module Configuration
    def configuration
      @configuration ||= OpenStruct.new
    end

    def configure
      yield(configuration)
    end
  end
end
