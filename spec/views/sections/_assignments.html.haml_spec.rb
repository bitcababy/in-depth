# encoding: UTF-8

require 'spec_helper'

describe "sections/_assignments" do
	include CourseMockHelpers
	
	before :each do
		teacher = mock_teacher
    teacher.stubs(:generic_msg).returns "This is a generic message"
		course = mock_course(number: 321, full_name: "Fractals 101")
		@section = mock_section_with_assignments(course: course, teacher: teacher)
		@section.stubs(:page_header).returns "Page header"
		assign(:section, @section)
	end

	it "displays the teacher's generic message" do
		render
		rendered.should have_selector('div#generic-msg', content: "This is a generic message")
	end
	
	it "displays the current assignment of a section" do
		render
		rendered.should have_selector('table#current')
	end
	
	it "skips displaying the teacher's current assignment message and the table if there isn't a current assignment" do
		@section.unstub(:current_assignments)
		@section.stubs(:current_assignments).returns []
		render
		rendered.should_not have_selector('table#current')
	end
	
	it "displays the past assignments of a section" do
		render
		rendered.should have_selector('table#past')
	end
	
	it "skips displaying the table for past assignments if there aren't any" do
		@section.unstub(:past_assignments)
		@section.stubs(:past_assignments).returns []
		render
		rendered.should_not have_selector('table#past')
	end

	
	it "displays the upcoming assignments of a section" do
		render
		rendered.should have_selector('table#upcoming')
	end
	
	it "skips displaying the table for upcoming assignments if there aren't any" do
		@section.unstub(:upcoming_assignments)
		@section.stubs(:upcoming_assignments).returns []
		render
		rendered.should_not have_selector('table#upcoming')
	end
		
		
end