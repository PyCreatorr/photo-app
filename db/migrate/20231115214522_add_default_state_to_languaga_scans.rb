class AddDefaultStateToLanguagaScans < ActiveRecord::Migration[7.0]
  def up
    change_table :scans do |t|
      t.change :language, :string, default: "eng"
    end
  end

  def down
    change_table :scans do |t|
      t.change :language, :string
    end
  end
end
