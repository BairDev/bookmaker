module BM
  class API < Grape::API
    prefix 'api'
    format :json
    mount ::BM::Start
  end
end