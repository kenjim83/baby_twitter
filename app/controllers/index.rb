# Home

get '/' do
  @last_ten_users = User.order(:created_at).limit(10)

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
  if User.find(params[:id]) == nil
    redirect '/oops'
  elsif session[:user_id] == params[:id]
    @user = User.find(params[:id])
    @user_name = @user.name
    @user_tweets = @user.tweets
    erb :profile
  else
    @user = User.find(params[:id])
    @user_name = @user.name
    @user_tweets = @user.tweets
    erb :profile
    #redirect '/'
  end

end


post '/tweet/new' do
  # Create new tweet per the user id
  user_id = session[:user_id]
  User.find(user_id).tweets.create(content: params[:tweet])
  redirect "/user/#{user_id}"
end

get '/oops' do
  "You have reached an error page"
end

post '/follow/:user_id' do
  @user_id = session[:user_id]
  @user_to_follow = params[:user_id]
  User.where(id: @user_id).first.follows.create(user_id: @user_id, follow_user_id: @user_to_follow)

  redirect "/user/#{@user_to_follow}"
end

