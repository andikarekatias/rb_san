class Pelabuhan < ApplicationRecord
    belongs_to :user
    has_many :spk, foreign_key: 'pelabuhan'
    validates :daerah, presence: true
    validates :nama_pelabuhan, presence: true
    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "daerah", "id", "nama_pelabuhan", "updated_at", "user_id"]
    end
    def self.ransackable_associations(auth_object = nil)
        ["user"]
    end
end
