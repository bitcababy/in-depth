require 'spec_helper'

describe CoursesController do
  describe "GET 'home'" do
    it "returns http success if the course exists" do
      course = mock('course') do
        stubs(:to_param).returns 1
        stubs(:year).returns Settings.academic_year
      end
      Course.stubs(:find).returns course
      get 'home', id: course.to_param
			expect(assigns[:course]).to eq course
      expect(response).to be_success
      expect(response).to render_template('home')
    end
    it "sets the section and returns the home page if section params are passed" do
      Section.stubs(:find_by).returns "bar"
      Course.stubs(:find).returns "foo"
      get :home, id: 1, teacher_id: 'doej', block: 'B'
      expect(response).to be_success
      expect(response).to render_template('home')
    end
  end
  
  describe '/course/:id/get_pane:kind' do
    it "returns the contents of a pane" do
      course = mock('course') do
        stubs(:to_param).returns 1
        stubs(:doc_of_kind).returns "foo"
      end
      Course.stubs(:find).returns course
      xhr :get, :get_pane, id: course.to_param, kind: :foo
      expect(response).to be_success
    end
  end
      
end
