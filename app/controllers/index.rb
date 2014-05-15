# Home

get '/' do
  erb :index
end

post '/user/login' do
  @user = User.find_by_username(params[:username])
  if @user && (@user.password == params[:password])
    session[:user_id] = @user.id
    redirect "/user/#{@user.id}"
  else
    redirect '/'
  end
end

post '/user/new' do
  @user = User.create(params)
  session[:user_id] = @user.id
  redirect "/user/#{@user.id}"
end

get '/logout' do
  session.clear
  redirect '/'
end


get '/user/:id' do
  if session[:user_id]
    @userid = params[:id]
    @user_name = User.find(@userid).name
    @user_tweets = User.find(@userid).tweets
    erb :profile
  else
    redirect '/'
  end

end


# Tweets

post '/tweet/new' do
  # Create new tweet per the user id
  user_id = session[:user_id]
  User.find(user_id).tweets.create(content: params[:tweet])
  redirect "/user/#{user_id}"
end


