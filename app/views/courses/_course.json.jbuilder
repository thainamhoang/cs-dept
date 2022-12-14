json.extract! course,
              :id,
              :code,
              :name,
              :description,
              :domain,
              :prerequisite,
              :credit,
              :created_at,
              :updated_at,
              :major,
              :minor,
              :offered
json.url course_url(course, format: :json)
