require ('sinatra')
require ('sinatra/contrib/all')
require ('pry-byebug')
require_relative( '../models/tag.rb' )
require_relative( '../models/transaction.rb' )
require_relative( '../models/user.rb' )

############### SHOW ACCOUNT DETAILS ####################################

get '/account' do
  @user = User.new({ "budget" => 500 })
  @tags = Tag.all()
  @total_spent = Transaction.total_spent()
  if params[:tag_id]
    @total_spent_by_tag = Transaction.total_spent_by_tag( params[:tag_id] )
    @selected_tag = Tag.find(params[:tag_id])
  end
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