json.extract! student, :id, :created_at, :updated_at, :title, :description, :image
json.url student_url(student, format: :json)
