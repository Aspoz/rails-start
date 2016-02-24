module Constraints
  class Api
    def initialize(options)
      @version = options[:version]
      @default = options[:default]
    end

    def matches?(req)
      @default || req.headers['Accept'].include?("application/vnd.twitch.v#{@version}")
    end
  end
end
