require 'spec_helper'

describe 'menus/_faculty' do
	it "displays a faculty list" do
		render partial: 'menus/faculty'
		rendered.should have_selector('li.faculty') do |li|
			li.should have_selector('a', href: '#', content: 'Faculty')
			li.should have_selector('ul#faculty-list')
		end
	end
end