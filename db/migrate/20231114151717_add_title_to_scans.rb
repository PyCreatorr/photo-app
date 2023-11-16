class AddTitleToScans < ActiveRecord::Migration[7.0]
  def change
    add_column :scans, :title, :string
  end
end
