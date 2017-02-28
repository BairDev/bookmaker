# Rack::Builder, from docu: 
#   use adds a middleware to the stack,
#   run dispatches to an application.
#   You can use map to construct a Rack::URLMap in a convenient way.

# simple start of Bookmaker
require 'rack'
require 'rack/server'

$:.unshift File.dirname(__FILE__) # add current directory to load path http://stackoverflow.com/a/5156130
$:.unshift "#{__dir__}/server"
$:.unshift "#{__dir__}/mod"
require 'frame'
require 'action'


app = Rack::Builder.new do
  # use ActionHello
  run BookmakerApp.app
end

route("/hello") do
  status 200
  "Hello #{params['name'] || "World"}!"
end

# route("/goodbye") do
#   status 500
#   "Goodbye Cruel World!"
# end

Rack::Handler::WEBrick.run(app, Port: 9292)

# now start Rack App with WEBrick: http://stackoverflow.com/a/10358651
# Rack::Handler::WEBrick.run(AppFrame.new, :Port => 9292)