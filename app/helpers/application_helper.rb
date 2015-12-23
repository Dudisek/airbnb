module ApplicationHelper

	def authorization? (id)
		current_user.id == id.to_i
	end

end


