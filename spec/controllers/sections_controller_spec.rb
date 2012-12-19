require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.	If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.	There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.	Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe SectionsController do
	include Mongoid::Document
  include FabricationMacros

  describe "GET 'assignments', xhr" do
   it "display the assignments page" do
      section = section_with_assignments
      section.teacher = Fabricate :teacher, login: "foo"
      section.save!
      
      xhr :get, :assignments, { course_id: section.course.to_param, year: section.academic_year, teacher_id: section.teacher.to_param, block: section.block}
      response.should be_success
      assigns(:section).should eq(section)
    end
  end
  
  describe '#find_section'

end
