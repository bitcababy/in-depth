class AssignmentsController < ApplicationController
	before_filter :find_assignment, only: [:show, :update, :edit, :delete]
	# before_filter :authenticate_user!, except: [:page]
	
	def page
		course_number = params['course_number'].to_i
		block = params['block']
		year = params['year'] || Settings.academic_year
	
		course = Course.find_by(number: course_number)
		rails "Course not found: #{course_number}" unless course
		@section = course.sections.where(academic_year: year, block: block).first
		raise "section not found: #{course_number}/#{block}" unless @section

		@upcoming_assignments = @section.section_assignments.upcoming.asc(:due_date)
		@current_assignment =  @section.section_assignments.current
		@past_assignments = @section.section_assignments.past.desc(:due_date).limit(Settings.past_assts_num)

		respond_to do |format|
      format.html
    end
	end

	# GET /assignments
  # GET /assignments.json
  def index
    @assignments = Assignment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @assignments }
    end
  end

  # GET /assignments/1
  # GET /assignments/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @assignment }
    end
  end

  # GET /assignments/new
  # GET /assignments/new.json
  def new
    @assignment = Assignment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @assignment }
    end
  end

  # GET /assignments/1/edit
  def edit
  end

  # POST /assignments
  # POST /assignments.json
  def create
    @assignment = Assignment.new(params[:assignment])

    respond_to do |format|
      if @assignment.save
        format.html { redirect_to @assignment, notice: 'Assignment was successfully created.' }
        format.json { render json: @assignment, status: :created, location: @assignment }
      else
        format.html { render action: "new" }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /assignments/1
  # PUT /assignments/1.json
  def update
    respond_to do |format|
      if @assignment.update_attributes(params[:assignment])
        format.html { redirect_to @assignment, notice: 'Assignment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.json
  def destroy
    @assignment.destroy

    respond_to do |format|
      format.html { redirect_to assignments_url }
      format.json { head :no_content }
    end
  end

 	private
	def find_assignment
		n = params[:id]
		@assignment = Assignment.find(n)
	end

end
