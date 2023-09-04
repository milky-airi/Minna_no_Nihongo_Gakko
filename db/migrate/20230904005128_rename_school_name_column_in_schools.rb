class RenameSchoolNameColumnInSchools < ActiveRecord::Migration[6.1]
  def change
    rename_column :schools, :school_name, :name
    rename_column :schools, :school_name_kana, :name_kana
    rename_column :schools, :school_name_en, :name_en
  end
end
