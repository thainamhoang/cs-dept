class CoursesController < ApplicationController
  before_action :set_course, only: %i[show edit update destroy]

  # GET /courses or /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1 or /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses or /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html do
          redirect_to course_url(@course),
                      notice: "Course was successfully created."
        end
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json do
          render json: @course.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /courses/1 or /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html do
          redirect_to course_url(@course),
                      notice: "Course was successfully updated."
        end
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json do
          render json: @course.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /courses/1 or /courses/1.json
  def destroy
    @course.destroy

    respond_to do |format|
      format.html do
        redirect_to courses_url, notice: "Course was successfully destroyed."
      end
      format.json { head :no_content }
    end
  end

  def get_next_offered(offered)
    spring = Array(1..5)
    fall = Array(8..12)
    current_month = Time.now.month
    current_year = Time.now.year

    if offered.include? "each"
      if offered.include? "Spring"
        if current_month >= 8
          return "Spring #{current_year + 1}"
        else
          return "Spring #{current_year + 2}"
        end
      elsif offered.include? "Fall"
        if current_month >= 8
          return "Fall #{current_year + 2}"
        else
          return "Fall #{current_year + 1}"
        end
      else
        if current_month >= 8
          return "Spring " + (current_year + 1).to_s
        else
          return "Fall " + current_year.to_s
        end
      end
    end

    if offered.include? "Spring"
      if offered.include? "odd"
        if current_year % 2 == 0
          return "Spring #{current_year + 1}"
        else
          return "Spring #{current_year + 2}"
        end
      elsif offered.include? "even"
        if current_year % 2 == 0
          return "Spring #{current_year + 2}"
        else
          return "Spring #{current_year + 1}"
        end
      else
        return "Spring #{current_year}"
      end
    elsif offered.include? "Fall"
      if offered.include? "odd"
        if current_year % 2 == 0
          return "Fall #{current_year + 1}"
        else
          return "Fall #{current_year + 2}"
        end
      elsif offered.include? "even"
        if current_year % 2 == 0
          return "Fall #{current_year + 2}"
        else
          return "Fall #{current_year + 1}"
        end
      else
        return "Fall #{current_year}"
      end
    end

    return "To be determined"
  end
  helper_method :get_next_offered

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def course_params
    params.require(:course).permit(
      :code,
      :name,
      :description,
      :domain,
      :prerequisite,
      :credit,
      :major,
      :minor,
      :offered
    )
  end
end
