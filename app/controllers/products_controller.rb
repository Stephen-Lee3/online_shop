# -*- encoding : utf-8 -*-
class ProductsController < ApplicationController
  load_and_authorize_resource
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
    @search  = Sunspot.search(Product) do 
        fulltext params[:query]
        with(:price).greater_than_or_equal_to(params[:min_price]) if params[:min_price].present?
        with(:price).less_than_or_equal_to(params[:max_price]) if params[:max_price].present?
    end
    @products = @search.results
  end
   
   def high_grade_search
     
   end
end
