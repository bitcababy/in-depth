# encoding: UTF-8

module ApplicationHelper
	include Utils
	include UserSessionHelper

	def academic_year_string(year)
		return "#{year-1}—#{year}"
	end

	def is_are_number_mangler(n, word)
		res = (n > 1 || n == 0) ? 'are ' : 'is '
		return res + pluralize(n, word).gsub(/^0/, 'no')
	end
	
	def duration_string(duration)
		return case duration
		when :full_year
			'Full Year'
		when :first_semester
			'First Semester'
		when :second_semester
			'Second Semester'
		when :halftime
			'Full Year, half time'
		end
	end
	
	def assignment_date_string(date)
		return date.strftime("%a, %b %-d")
	end
	
	def section_label_for_menu(section)
		if section.teacher then
			return section.teacher.formal_name + ", Block " + section.block
		else
			return section.to_s
		end
	end
	
	def custom_form_for(object, *args, &block)
		options = args.extract_options!
		simple_form_for(object, *(args << options.merge(:builder => CustomFormBuilder)), &block)
  end
	

end
