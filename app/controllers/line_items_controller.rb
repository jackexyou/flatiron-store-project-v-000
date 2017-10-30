class LineItemsController < ApplicationController
	def create
    current_user.create_current_cart if !user_has_current_cart?
    line_item = load_users_cart.add_item(params[:item_id])
    if line_item.save
      redirect_to cart_path(load_users_cart)
    else
      redirect_to store_path
    end
  end

  private

  def user_has_current_cart?
    !!current_user.current_cart
  end

  def load_users_cart
    current_user.current_cart
  end
end
