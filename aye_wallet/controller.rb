require ('sinatra')
require ('sinatra/contrib/all')
require ('sanitize')
require_relative ( 'controllers/account_controller' )
require_relative ( 'controllers/transactions_controller' )

get '/' do
  erb ( :index )
end