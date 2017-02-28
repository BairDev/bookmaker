module BM
  class Start < Grape::API
    get '/' do
      file '/path/to/file'
    end
  end
end