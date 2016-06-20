class ItemsController < ApplicationController
    
    before_action :find_item, only: [:show, :edit, :destroy, :update]
    
    def index
        @items = Item.all.order("created_at DESC")
    end
    
    def new
        @item = Item.new
    end
    
    def create
        @item = Item.new(param_items)
            
        if @item.save
            redirect_to items_path
        else
            render "new"
        end
    end
    
    def show
      
    end
    
    def edit
       
    end
    
    def destroy
      
        if @item.destroy
            redirect_to root_path
        else
            render 'index'
        end
        
    end
    
    def update
        
        
        if @item.update_attributes(param_items)
            redirect_to item_path(@item)
        else 
            render "edit"
        end
    
    end
    
    def find_item
         @item = Item.find(params[:id])
    end
    
    def param_items
        params.require(:item).permit(:title, :description)
    end
    
end
