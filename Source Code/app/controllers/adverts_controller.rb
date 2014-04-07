class AdvertsController < ApplicationController
	
	def new 
		@advert = Advert.new
	end

	def create
	  	if !signed_in?
			flash[:error] = "You need to login first!!!"
			redirect_to root_path
		else
	  		@advert = Advert.new(params[:advert])
			@advert.user_id = current_user.id
			@advert.save
			flash[:success] = "You just created a new Add!!!"
			redirect_to new_interval_path
      	end
	end

	def index
		@adverts = Advert.where("reverse = ?",false)
		@reverseadverts=Advert.where("reverse = ?",true)
	end

	def show
		@advert = Advert.find(params[:id])
		@user = User.find(@advert.user_id)
	end
 
    def edit
	  	@advert = Advert.find(params[:id])
    	if !(signed_in? && correct_user?)
			flash[:error] = "You don't have the permission to edit it!!!"
			redirect_to root_path
      	end
    end

	def update
		@advert = Advert.find(params[:id])
		if !(signed_in? && correct_user?)
			flash[:error] = "You don't have the permission to delete it!!!"
		   redirect_to adverts_path
		else
		    @advert.update_attributes(params[:advert])
		    flash[:success] = "You just updated the Add!!!"
			redirect_to advert_path
		end
	end

	def destroy
		@advert = Advert.find(params[:id])
	    if !(signed_in? && correct_user?)
	       flash[:error] = "You don't have the permission to delete it!!!"
		   redirect_to adverts_path
	    else
		   @advert.destroy
		   flash[:success] = "You have just delete the Advert"
		   redirect_to adverts_path
	    end
	end

    
end
