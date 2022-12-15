require "test_helper"

class StudentsControllerTest < ActionDispatch::IntegrationTest
  setup { @student = students(:one) }

  test "should get index" do
    get students_url
    assert_response :success
  end

  test "should get new" do
    get new_student_url
    assert_response :success
  end

  test "should create student" do
    assert_difference("Student.count") do
      post students_url,
           params: {
             student: {
               title: @student.title,
               description: @student.description,
               image: @student.image,
               introduction: @student.introduction,
               name: @student.name
             }
           }
    end

    assert_redirected_to student_url(Student.last)
  end

  test "should show student" do
    get student_url(@student)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_url(@student)
    assert_response :success
  end

  test "should update student" do
    patch student_url(@student),
          params: {
            student: {
              title: @student.title,
              description: @student.description,
              image: @student.image,
              introduction: @student.introduction,
              name: @student.name
            }
          }
    assert_redirected_to student_url(@student)
  end

  test "should destroy student" do
    assert_difference("Student.count", -1) { delete student_url(@student) }

    assert_redirected_to students_url
  end
end
