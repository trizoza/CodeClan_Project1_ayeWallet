require ('sinatra')
require ('sinatra/contrib/all')
require ('pry')
require_relative( 'models/tag.rb' )
require_relative( 'models/transaction.rb' )
require_relative( 'models/user.rb' )

get '/' do
  erb ( :index )
end

get '/transactions' do
  @user = User.new({ "budget" => 500 })
  @transactions = Transaction.all()
  @total_spent = Transaction.total_spent()
  erb ( :"transactions/index" )
end

get '/transactions/new' do
  @transactions = Transaction.all()
  @tags = Tag.all()
  erb( :"transactions/new" )
end

post '/transactions' do
  transaction = Transaction.new(params)
  transaction.save()
  redirect to("/transactions")
end

post '/transactions/:id/delete' do
  Transaction.destroy( params[:id] )
  redirect to("/transactions")
end

get '/transactions/:id' do
  id = params[:id].to_i
  @transaction = Transaction.find( id )
  erb( :"transactions/show" )
end

get '/transactions/:id/edit' do
  id = params[:id].to_i
  @transaction = Transaction.find( id )
  @tags = Tag.all()
  erb( :"transactions/edit" )
end

post '/transactions/:id' do
  Transaction.update( params )
  redirect to("/transactions/#{params[:id]}")
end