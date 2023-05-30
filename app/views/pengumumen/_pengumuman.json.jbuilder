json.extract! pengumuman, :id, :title, :body, :user_id, :created_at, :updated_at
json.url pengumuman_url(pengumuman, format: :json)
