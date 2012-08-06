# encoding: UTF-8

module ApplicationHelper

	def is_are_number_mangler(n, word)
		case
			when n > 1
				res = "are "
			when n == 1 then
				res = "is "
			when n == 0 then
				res = "are "
		end
		return res + pluralize(n, word).gsub(/^0/, 'no')
	end

	def academic_year_string(year)
		return "#{year-1}—#{year}"
	end
	
	def duration_string(duration)
		case duration
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
	
	def render_home_menu
		render partial: 'menus/home'
	end
	
	def render_courses_menu
		@courses = Course.in_catalog
		render partial: 'menus/courses' if @courses
	end
	
	def render_sections_of_course(course)
		sections = course.current_sections
		render partial: 'menus/section', collection: sections if sections
	end
	
	def render_teachers
		teachers = Teacher.current
		render partial: 'menus/teacher', collection: teachers if teachers
	end

	def render_faculty_menu
		render partial: 'menus/faculty'
	end
	
	def render_manage_menu
		# render partial: 'menus/manage'
	end
	
	def render_menubar
		render 'menus/menubar'
	end
	
	def section_label_for_menu(section)
		if section.teacher then
			section.teacher.formal_name + ", Block " + section.block
		else
			section.to_s
		end
	end
	
	# Devise stuff
	def devise_mapping
		Devise.mappings[:user]
	end
	
	def resource_name
		devise_mapping.name
	end
	
	def resource_class
		devise_mapping.to
	end
	
	def authenticate_user!(opts={})
		opts[:scope] = :user
		warden.authenticate!(opts) if !devise_controller? || opts.delete(:force)
	end

	def current_user
		@current_user ||= warden.authenticate(:scope => :user)
	end

	def user_signed_in?
		!!current_user
	end

	def user_session
		current_user && warden.session(:user)
	end
	

end
