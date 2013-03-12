require 'spec_helper'

describe AssignmentsController do
  include DeviseHelpers
  login_user
  
  describe "GET 'new'" do
    before :each do
      teacher = Fabricate :teacher
      @course = Fabricate :course
      @course.major_topics = [
        Fabricate(:none_topic),
        Fabricate(:major_topic, name: "Quadratics"), 
        Fabricate(:major_topic, name: "Functions"), 
        Fabricate(:major_topic, name: 'Exponents/Logs'),
        Fabricate(:major_topic, name: 'Systems of Equations'),
      ]
      3.times {
        @course.sections << Fabricate(:section, teacher: teacher, year: Settings.year)
      }
      expect(@course.sections.count).to eq 3
      get :new, teacher_id: teacher.to_param, course_id: @course.to_param
      expect(response).to be_success
    end

    it "should build an assignment and section assignments for each current section" do
      expect(asst = assigns[:assignment]).to be_kind_of Assignment
      expect(asst).to_not be_persisted
      expect(asst.section_assignments.to_a.count).to eq 3
    end
     
    it "should render the 'new' template" do
      expect(response).to render_template :new
    end
      
  end # "GET 'new'"
  
  # {"utf8"=>"✓",
  #  "authenticity_token"=>"DhPaLUa1M8OtPHUYOS3IZ4J0KgXw/WTB+SfDZAxqyus=",
  #  "assignment"=>{
  #    "teacher_id"=>"davidsonl",
  #    "section_assignments_attributes"=>{
  #      "0"=>{"due_date"=>"2013-02-14", "assigned"=>"1", "section"=>"2013/321/davidsonl/B"},
  #      "1"=>{"due_date"=>"2013-02-14", "assigned"=>"1", "section"=>"2013/321/davidsonl/D"}},
  #      "major_topics"=>["", "Similarity", "Measurement"],
  #      "name"=>"",
  #      "content"=>""
  #   }
  # }   
  
  describe "PUT create" do
    before :each do
      teacher = Fabricate :teacher
      s1 = Fabricate :section
      s2 = Fabricate :section
      @parms = {
        assignment: {
          "teacher_id" => teacher.to_param,
          "section_assignments_attributes"=>{
          "0"=>{"due_date"=>"2013-02-12", "assigned"=>"1", "block"=>"B", "section"=>s1.to_param},
          "1"=>{"due_date"=>"2013-02-12", "assigned"=>"1", "block"=>"D", "section"=>s2.to_param}
          },
          "content"=>"Some content",
          "name" => "foo",
         }
       }
    end

    it "creates the assignment" do
      expect { put :create, @parms }
      .to change{ Assignment.count }.by(1)
    end
    it "creates the section_assignments" do
      expect { put :create, @parms }
      .to change{ SectionAssignment.count }.by(2)
    end
  end

  describe "PUT create, xhr" do
    before :each do
      teacher = Fabricate :teacher
      s1 = Fabricate :section
      s2 = Fabricate :section
      @parms = {
        assignment: {
          "teacher_id" => teacher.to_param,
          "section_assignments_attributes"=>{
          "0"=>{"due_date"=>"2013-02-12", "assigned"=>"1", "block"=>"B", "section"=>s1.to_param},
          "1"=>{"due_date"=>"2013-02-12", "assigned"=>"1", "block"=>"D", "section"=>s2.to_param}
          },
          "content"=>"Some content",
          "name" => "foo",
         }
       }
       session[:form] = {}
       session[:form][:redirect_url] = "/"
    end

    it "creates the assignment" do
      expect { xhr :put, :create, @parms }
      .to change{ Assignment.count }.by(1)
    end
    it "creates the section_assignments" do
      expect { xhr :put, :create, @parms }
      .to change{ SectionAssignment.count }.by(2)
    end
  end
      
end
