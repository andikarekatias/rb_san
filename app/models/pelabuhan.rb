class Pelabuhan < ApplicationRecord
    belongs_to :user
    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "daerah", "id", "nama_pelabuhan", "updated_at", "user_id"]
    end
    def self.ransackable_associations(auth_object = nil)
        ["user"]
    end
end
