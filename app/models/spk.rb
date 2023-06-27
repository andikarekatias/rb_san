class Spk < ApplicationRecord
    belongs_to :master_kapal, foreign_key: 'kapal'
    belongs_to :pelabuhans, foreign_key: 'pelabuhan', class_name: 'Pelabuhan'   
    enum kegiatan: [ :BONGKAR, :MUAT, :KERUK, :MENETAP, :ISI_AIR, :DOK, :FLAG_FEE, :EMERGENCY ]    
    has_one_attached :surat_penunjukan
    has_one_attached :manifest_dock_origin
    has_one_attached :spb_dock_origin
    before_create :generate_no_spk
    validates_presence_of :kapal, :voyage, :kegiatan, :est_tiba, :est_berangkat, :pelabuhan, :surat_penunjukan, :manifest_dock_origin, :spb_dock_origin
    def generate_no_spk
        timestamp = Time.now.strftime("%Y%m%d")
        self.no_spk = "SPK-#{timestamp}#{Spk.maximum(:id).to_i + 1}"
    end
end