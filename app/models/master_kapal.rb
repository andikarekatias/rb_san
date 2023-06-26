class MasterKapal < ApplicationRecord
    enum jenis_kapal: {
        MV: :MV,
        MT: :MT,
        TB: :TB,
        TK: :TK,
        PENUMPANG: :PENUMPANG,
        KERUK: :KERUK,
        KHUSUS: :KHUSUS
      }
    has_one_attached :surat_ukur
    has_one_attached :surat_laut
    has_one_attached :foto_kapal
end
