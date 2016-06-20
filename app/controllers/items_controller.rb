class ItemsController < ApplicationController
    
    def index
        @items = Item.all.order("created_at DESC")
    end
    
    def new
        @item = Item.new
    end
    
    def create
        @item = Item.new(params.require(:item).permit(:title, :description))
            
        if @item.save
            redirect_to items_path
        else
            render "new"
        end
       

        
      
    end
    
    
end
