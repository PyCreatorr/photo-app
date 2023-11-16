class MoveBodyToActionTextImgScanToActionText < ActiveRecord::Migration[7.0]
  def change
    Scan.all.find_each do |scan|
      scan.update(scan_content: scan.img_scan)
    end

    remove_column :scans, :img_scan
  end
end
