class CartsController < ApplicationController
	before_action :load_cart, only: [:show, :checkout]
  
  def show
  end

  def checkout
    @cart.checkout
    redirect_to cart_path(@cart)
    current_user.remove_current_cart
  end

  private

  def load_cart
    @cart = Cart.find(params[:id])
  end
end
