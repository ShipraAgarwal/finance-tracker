class StocksController < ApplicationController
   def search
   	if params[:stock].blank?
		  flash.now[:danger] = "you have entered an empty symbol"
	else
	   @stock =	Stock.new_from_lookup(params[:stock])
	   if @stock
	     
	   else
	   	 flash.now[:danger] = "you have entered a wrong symbol"
	   end		
	end
	respond_to do |format|
      format.js { render partial: 'users/result' }
    end
   end
end