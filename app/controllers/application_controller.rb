class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # add routes
  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    # returns a single bakery as JSON with its baked goods nested
    bakery.to_json(include: :baked_goods)
  end

  # GET /baked_goods/by_price
  # returns an array of baked goods as JSON, sorted by price in descending order
  get '/baked_goods/by_price' do
    baked_goods = BakedGood.all.sort_by { |baked_good| baked_good.price }.reverse
    baked_goods.to_json
  end

  # GET /baked_goods/most_expensive
  # returns the single most expensive baked good as JSON
  get '/baked_goods/most_expensive' do
    baked_good = BakedGood.all.sort_by { |baked_good| baked_good.price }.last
    baked_good.to_json
  end
  
end
