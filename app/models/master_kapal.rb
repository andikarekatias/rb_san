class MasterKapal < ApplicationRecord
    enum jenis_kapal: [ :MV, :MT, :TB, :TK, :PENUMPANG, :KERUK, :KHUSUS ]
    has_one_attached :surat_ukur
    has_one_attached :surat_laut
    has_one_attached :foto_kapal    
    validate :image_file_format
    has_many :spk, foreign_key: 'kapal'
    validates_presence_of :nama_kapal, :bendera, :pemilik, :alamat_owner, :jenis_pelayaran, :jenis_kapal, :imo_number, :call_sign, :dwt, :gt, :loa, :draft_depan, :draft_belakang, :hp_mesin
    private

    def image_file_format
      return unless foto_kapal.attached?
      unless foto_kapal.content_type.in?(%w(image/jpeg image/png image/gif))
        foto_kapal.purge
        errors.add(:foto_kapal, 'must be a JPEG, PNG, or GIF image')
      end
    end

end
