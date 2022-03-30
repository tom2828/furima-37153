class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order_item, only: [:index, :create]

  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end




  private
  def order_params
    params.require(:order_form).permit(:post_code, :prefecture_id, :city, :address, :building_name, :tel).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_order_item
    @item = Item.find(params[:item_id])
  end



end
