json.extract! master_kapal, :id, :nama_kapal, :bendera, :pemilik, :alamat_owner, :jenis_pelayaran, :jenis_kapal, :imo_number, :call_sign, :dwt, :gt, :loa, :draft_depan, :draft_belakang, :hp_mesin, :created_at, :updated_at
json.url master_kapal_url(master_kapal, format: :json)
