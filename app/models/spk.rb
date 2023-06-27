class Spk < ApplicationRecord
    belongs_to :master_kapal, foreign_key: 'kapal'
    belongs_to :pelabuhans, foreign_key: 'pelabuhan', class_name: 'Pelabuhan'   
    enum kegiatan: [ :BONGKAR, :MUAT, :KERUK, :MENETAP, :ISI_AIR, :DOK, :FLAG_FEE, :EMERGENCY ]    
    has_one_attached :surat_penunjukan
    has_one_attached :manifest_dock_origin
    has_one_attached :spb_dock_origin
end