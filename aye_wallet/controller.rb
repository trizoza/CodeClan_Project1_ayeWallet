require ('sinatra')
require ('sinatra/contrib/all')
require ('pry')
require_relative( 'models/tag.rb' )
require_relative( 'models/transaction.rb' )
require_relative( 'models/user.rb' )

get '/' do
  erb ( :index )
end

############ SHOW TRANSACTIONS ################################

get '/transactions' do
  @user = User.new({ "budget" => 500 })
  @transactions = Transaction.all()
  @total_spent = Transaction.total_spent()
  erb ( :"transactions/index" )
end

############ ADD NEW TRANSACTION ################################

get '/transactions/new' do
  @transactions = Transaction.all()
  @tags = Tag.all()
  erb( :"transactions/new" )
end

############ SAVE NEW TRANSACTION ################################

post '/transactions' do
  transaction = Transaction.new(params)
  transaction.save()
  redirect to("/transactions")
end

############ DELETE TRANSACTION ###################################


post '/transactions/:id/delete' do
  Transaction.destroy( params[:id] )
  redirect to("/transactions")
end

############ SHOW TRANSACTION #####################################

get '/transactions/:id' do
  id = params[:id].to_i
  @transaction = Transaction.find( id )
  erb( :"transactions/show" )
end

############ EDIT TRANSACTION #####################################

get '/transactions/:id/edit' do
  id = params[:id].to_i
  @transaction = Transaction.find( id )
  @tags = Tag.all()
  erb( :"transactions/edit" )
end

############ SAVE EDITED TRANSACTION #####################################

post '/transactions/:id' do
  Transaction.update( params )
  redirect to("/transactions/#{params[:id]}")
end

############### SHOW ACCOUNT DETAILS ####################################

get '/account' do
  @user = User.new({ "budget" => 500 })
  @tags = Tag.all()
  @total_spent = Transaction.total_spent()
  erb ( :"account/index" )
end

############ ADD NEW TAG #################################################

get '/account/new' do
  @tags = Tag.all()
  erb ( :"account/new" )
end

############ SAVE NEW TAG #################################################

post '/account' do
  tag = Tag.new(params)
  tag.save()
  redirect to( "/account" )
end

############ EDIT TAG #################################################

get '/account/:id/edit' do
  id = params[:id].to_i
  @tag = Tag.find( id )
  @tags = Tag.all()
  erb( :"account/edit" )
end

############ SAVE EDITED TAG #################################################

post '/account/:id' do
  Tag.update( params )
  redirect to( "/account" )
end