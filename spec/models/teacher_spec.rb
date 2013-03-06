require 'spec_helper'

describe Teacher do
	it { should have_many(:sections) }
		
	# context "scopes" do
	# 	it "should return current teachers" do
	# 		3.times {Fabricate(:teacher, current: true)}
	# 		2.times {Fabricate(:teacher, current: false)}
	# 		Teacher.count.should == 5
	# 		Teacher.current.count.should == 3
	# 	end
	# end
	# 
	
	context "courses" do
		before :each do
			@teacher = Fabricate(:teacher)
			course2 = Fabricate(:course, full_name: "Geometry Honors")
			course1 = Fabricate(:course, full_name: "Fractals")
			Fabricate(:section, teacher: @teacher, course: course1, block: "A")
			Fabricate(:section, teacher: @teacher, course: course1, block: "B")
			Fabricate(:section, teacher: @teacher, course: course2, block: "C")
			Fabricate(:section, teacher: @teacher, course: course2, block: "D")
		end
			
		describe '#courses' do
			it "should return the courses that a teacher is teaching" do
				@teacher.courses.count.should == 2
			end
		end
		
		describe '#course_names' do
			it "should return the names of the courses that a teacher is teaching" do
				@teacher.course_names.should == ["Fractals", "Geometry Honors"]
			end
		end
    
	end
	
	context "Fabrication testing" do
		it "should accept a login override" do
			Fabricate(:teacher, login: 'greenx')
			Teacher.where(login: 'greenx' ).should exist
		end
	end
  
	
	
end
