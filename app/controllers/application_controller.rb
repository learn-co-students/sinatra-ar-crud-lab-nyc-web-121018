
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
  end

  get '/' do
    redirect to "/articles"
  end

  get '/articles/new' do
    @articles = Article.all
    erb:new
  end

# new
post '/articles' do
  @articles = Article.create(params)
  # (:title => params ['title'], :content => params ['content'])
  redirect "/article/#{@article.id}"
end

#show

get 'articles/:id/edit' do
  @article = Article.find_by_id(params['id'])
  erb:show
end

# edit
patch "/articles/:id" do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{ @article.id }"
  end

  # show
get "/articles/:id" do
  @article = Article.find(params[:id])
  erb :show
end

# edit
get "/articles/:id/edit" do
  @article = Article.find(params[:id])
  erb :edit
end

  #destroy
  delete "/articles/:id" do
    Article.destroy(params[:id])
    redirect to "/articles"
  end

end
