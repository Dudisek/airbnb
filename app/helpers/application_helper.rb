module ApplicationHelper

	def authorization? (id)
		current_user.id == id.to_i if current_user
	end

	def flash_class(level)
	  case level.to_sym
	    when :notice then "alert alert-success"
	    when :info then "alert alert-info"
	    when :alert then "alert alert-danger"
	    when :warning then "alert alert-warning"
	  end
  end
  
end


