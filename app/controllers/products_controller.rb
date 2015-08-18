# -*- encoding : utf-8 -*-
class ProductsController < ApplicationController
  def index
    @products = Product.all.order("created_at desc")
  end

  def show
    @product = Product.find(params[:id])
    @comments_count = @product.comments.count
  end

  def detail
    @product = Product.find(params[:id])
    respond_to do |format|
      format.js
    end
  end
   
   def search
    @search  = Product.solr_search do 
        fulltext params[:query]
    end
    @products = @search.results
  end
end
