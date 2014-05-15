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

"PROFILE PAGE!"
end