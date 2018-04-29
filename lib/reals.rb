require "reals/version"
require "reals/array"

module Reals
  class Application
    def call(env)
      `echo debug > debug.txt`
      [200, {'Content-Type' => 'text/html'},
        ["Hello from Ruby on Reals!"]]
    end
  end
end
