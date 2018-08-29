class StocksController < ApplicationController
   def search
   	if params[:stock].blank?
   		respond_to do |format|
		  flash.now[:danger] = "you have entered an empty symbol"
		  format.js { render partial: 'users/result' }
		end
	else
	   @stock =	Stock.new_from_lookup(params[:stock])
	   if @stock
	      respond_to do |format|
            format.js { render partial: 'users/result' }
          end
	   else
	   	  respond_to do |format|
		 	 flash.now[:danger] = "you have entered a wrong symbol"
		 	 format.js { render partial: 'users/result' }
		  end
	   end		
	end
   end
end