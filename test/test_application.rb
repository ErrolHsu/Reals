require_relative "test_helper"

class TestApp < Reals::Application
end

class RealsAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_request
    get '/'

    assert last_response.ok?
    body = last_response.body

    assert body["Hello"]
  end
end



