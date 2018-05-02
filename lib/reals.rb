require "reals/version"
require "reals/array"
require "reals/routing"

module Reals

  class Application
    def call(env)
      begin

        #暫時擋一下
        if env['PATH_INFO'] == '/favicon.ico'
          return [404, {'Content-Type' => 'text/html'}, []]
        end

        #root temp
        if env['PATH_INFO'] == '/'
          env['PATH_INFO'] = '/home/index'
        end

        #302
        if env['PATH_INFO'] == '/302_test'
          return [302, {'Location' => '/home/index'}, []]
        end

        klass, act = get_controller_and_action(env)
        controller = klass.new(env)
        text = controller.send(act)
        [200, {'Content-Type' => 'text/html'},
          [text]]

      rescue
        html = File.read("app/views/500.html")
        [500, {'Content-Type' => 'text/html'},
          [html]]
      end
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
    end
  end

end
