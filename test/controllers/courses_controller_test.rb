require "test_helper"

class CoursesControllerTest < ActionDispatch::IntegrationTest
  setup { @course = courses(:one) }

  test "should get index" do
    get courses_url
    assert_response :success
  end

  test "should get new" do
    get new_course_url
    assert_response :success
  end

  test "should create course" do
    assert_difference("Course.count") do
      post courses_url,
           params: {
             course: {
               code: @course.code,
               credit: @course.credit,
               description: @course.description,
               domain: @course.domain,
               name: @course.name,
               prerequisite: @course.prerequisite,
               major: @course.major,
               minor: @course.minor,
               offered: @course.offered
             }
           }
    end

    assert_redirected_to course_url(Course.last)
  end

  test "should show course" do
    get course_url(@course)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_url(@course)
    assert_response :success
  end

  test "should update course" do
    patch course_url(@course),
          params: {
            course: {
              code: @course.code,
              credit: @course.credit,
              description: @course.description,
              domain: @course.domain,
              name: @course.name,
              prerequisite: @course.prerequisite,
              major: @course.major,
              minor: @course.minor,
              offered: @course.offered
            }
          }
    assert_redirected_to course_url(@course)
  end

  test "should destroy course" do
    assert_difference("Course.count", -1) { delete course_url(@course) }

    assert_redirected_to courses_url
  end
end
