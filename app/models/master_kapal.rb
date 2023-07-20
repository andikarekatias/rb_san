class MasterKapal < ApplicationRecord
    enum jenis_kapal: [ :MV, :MT, :TB, :TK, :PENUMPANG, :KERUK, :KHUSUS ]
    has_one_attached :surat_ukur
    has_one_attached :surat_laut
    has_one_attached :foto_kapal    
    validate :image_file_format
    has_many :spk, foreign_key: 'kapal'
    validates_presence_of :nama_kapal, :bendera, :pemilik, :alamat_owner, :jenis_pelayaran, :jenis_kapal, :imo_number, :call_sign, :dwt, :gt, :loa, :draft_depan, :draft_belakang, :hp_mesin
    def self.ransackable_attributes(auth_object = nil)
      ["alamat_owner", "bendera", "call_sign", "created_at", "draft_belakang", "draft_depan", "dwt", "gt", "hp_mesin", "id", "imo_number", "jenis_kapal", "jenis_pelayaran", "loa", "nama_kapal", "pemilik", "updated_at"]
    end
    def self.ransackable_associations(auth_object = nil)
      ["foto_kapal_attachment", "foto_kapal_blob", "spk", "surat_laut_attachment", "surat_laut_blob", "surat_ukur_attachment", "surat_ukur_blob"]
    end
    private

    def image_file_format
      return unless foto_kapal.attached?
      unless foto_kapal.content_type.in?(%w(image/jpeg image/png image/gif))
        foto_kapal.purge
        errors.add(:foto_kapal, 'must be a JPEG, PNG, or GIF image')
      end
    end

end
