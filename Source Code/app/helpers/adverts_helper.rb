module AdvertsHelper

	def correct_user?
    		return @advert.user_id.to_i == current_user.id
    	end


end
