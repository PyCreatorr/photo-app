class AddLanguageToScans < ActiveRecord::Migration[7.0]
  def change
    add_column :scans, :language, :string
  end
end
