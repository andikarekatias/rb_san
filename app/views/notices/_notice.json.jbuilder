json.extract! notice, :id, :title, :body, :user_id, :created_at, :updated_at
json.url notice_url(notice, format: :json)
