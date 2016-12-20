require ('sinatra')
require ('sinatra/contrib/all')
require ('pry-byebug')
require_relative( '../models/tag.rb' )
require_relative( '../models/transaction.rb' )
require_relative( '../models/user.rb' )

############### SHOW ACCOUNT DETAILS ####################################

get '/account' do
  @budget = User.check_budget()
  @tags = Tag.all()
  @total_spent = Transaction.total_spent()
  if params[:tag_id]
    @total_spent_by_tag = Transaction.total_spent_by_tag( params[:tag_id] )
    @selected_tag = Tag.find(params[:tag_id]) 
  end
  erb ( :"account/index" )
end

################# EDIT BUDGET ############################################

get '/account/edit' do
  @user = User.find(1)
  @budget = User.check_budget()
  erb( :"account/edit" )
end

################# UPDATE EDITED BUDGET ############################################

post '/account' do
  User.update_budget( params )
  redirect to( "/account" )
end

############### SHOW CATEGORIES ##########################################

get '/account/tags' do
  @tags = Tag.all()
  erb ( :"tags/index" )
end

############ ADD NEW TAG #################################################

get '/account/tags/new' do
  @tags = Tag.all()
  erb ( :"tags/new" )
end

############ SAVE NEW TAG #################################################

post '/account/tags' do
  tag = Tag.new(params)
  tag.save()
  redirect to( "/account/tags" )
end

############ EDIT TAG #################################################

get '/account/tags/:id/edit' do
  id = params[:id].to_i
  @tag = Tag.find( id )
  @tags = Tag.all()
  erb( :"tags/edit" )
end

############ SAVE EDITED TAG #################################################

post '/account/tags/:id' do
  Tag.update( params )
  redirect to( "/account/tags" )
end