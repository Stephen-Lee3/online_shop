# -*- encoding : utf-8 -*-
class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def detail
    @product = Product.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

end
