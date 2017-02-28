# Action is from here: https://gist.github.com/markbates/4240848
# creates a new Response, based on a request and uses
# Rack (has a call method).
# Uses instance variables (@var || self.var) a lot: http://strugglingwithruby.blogspot.de/2010/03/variables.html
class Action
  attr_reader :headers, :body, :request # colons: https://www.ruby-forum.com/topic/2551601#1021229

  # make a Proc out of block: http://www.skorks.com/2013/04/ruby-ampersand-parameter-demystified/
  # instead of: store the block internally: http://stackoverflow.com/a/5241013/2092322
  def initialize(&block) 
    @block = block
    @status = 200
    @headers = {"Content-Type" => "text/html"}
    @body = ""
  end

  def status(value = nil)
    value ? @status = value : @status
  end

  def params
    request.params
  end

  # Finally, we implement a call method that takes in the env hash and creates a
  # Rack::Request object from it. We then use instance_eval to evaluate
  # the original block in the context of the Action object so it has access to
  # all of the methods and goodies in the Action class.
  def call(env)
    @request = Rack::Request.new(env)
    @body = self.instance_eval(&@block) # https://ruby-doc.org/core-2.2.0/BasicObject.html#method-i-instance_eval
    return [status, headers, [body]]
  end

end