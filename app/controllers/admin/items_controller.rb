class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def index
    @items = Item.all
  end

  def create
    @item = Item.new(item_params)
    genre_list = params[:item][:genre].split(',')
    @item.save
    @item.save_genres(genre_list)
    redirect_to admin_items_path

  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(paramas[:id])
    @item.update(item_params)
    redirect_to admin_items_show_path
  end

  def destroy
    @item = Item.find(paramas[:id])
    @item.destroy
    redirect_to admin_items_index_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :genre_id, :introduction, :price, :is_active, :image)
  end
end