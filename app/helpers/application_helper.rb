# encoding: UTF-8

module ApplicationHelper

	def academic_year_string(year)
		return "#{year-1}—#{year}"
	end
	
	def assignment_date_string(date)
		return date.strftime("%a, %b %-d")
	end

end
