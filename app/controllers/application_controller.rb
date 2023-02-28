class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/' do
    '<h1>Welcome to the bakery !</h1>'
  end

  get '/bakeries' do
    Bakery.all.to_json
  end

  get '/bakeries/:id' do
    Bakery.find(params[:id]).to_json
  end

  get '/baked_goods/by_price' do
    BakedGood.all.order("price DESC").to_json
  end

  get '/baked_goods/most_expensive' do
    BakedGood.all.order("price DESC").limit(1).to_json
  end
end
