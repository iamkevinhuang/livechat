module ApplicationHelper

	def time_to_string data
		data.nil? ? '?' : data.strftime("%H:%M")
	end
end
