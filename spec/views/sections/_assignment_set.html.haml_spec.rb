require 'spec_helper'

describe 'sections/_assignment_set' do
	it "renders a table containing the current assignment" do
		asst = mock('assignment') do
			stubs(:content).returns "Assignment content"
		end

		sa = mock('section_assignment') do
			stubs(:name).returns '21'
			stubs(:due_date).returns Date.new(2012, 7, 20)
			stubs(:assignment).returns asst
		end

		render partial: 'sections/assignment_set', locals:{table_id: 'current', sas: [sa], message: "Message", title: 'Current assignment'}
		rendered.should have_selector('div.assignment-block') do |div|
			div.should have_selector('div.title', content: 'Current assignment')
			pending "Unfinished test"
		end
	end
end