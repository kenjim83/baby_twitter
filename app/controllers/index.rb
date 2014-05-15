get '/' do
  erb :index
end

post '/user/login' do
  @user = User.find_by_username(params[:username])
  session[:user_id] = @user.id
  redirect "/user/#{@user.id}"
end

post '/user/new' do
  @user = User.create(params)
  session[:user_id] = @user.id
  redirect "/user/#{@user.id}"
end

post 'user/logout' do
  session.clear
end

get '/user/:id' do

get '/info' do
  Demo.new(self).info
end

get '/user/:id' do
  @userid = params[:id]
  @user_name = User.find(@userid).name
  @user_tweets = User.find(@userid).tweets

  erb :profile
end
