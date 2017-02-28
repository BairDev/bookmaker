# This Frame uses Rack::Builder and handles the default route
class BookmakerApp
  def self.app
    @app ||= begin
      Rack::Builder.new do
        map "/" do
          run ->(env) {[404, {'Content-Type' => 'text/plain'}, ['Page Not Found!']] }
        end
      end
    end
  end
end

# method for adding new routes to the app, based on Action
def route(pattern, &block)
  BookmakerApp.app.map(pattern) do
    run Action.new(&block)
  end
end