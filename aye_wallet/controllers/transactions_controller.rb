require ('sinatra')
require ('sinatra/contrib/all')
require_relative( '../models/tag.rb' )
require_relative( '../models/transaction.rb' )
require_relative( '../models/user.rb' )

############ SHOW TRANSACTIONS ################################

get '/transactions' do
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