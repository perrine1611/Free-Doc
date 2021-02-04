class RemoveSpecialtyFromDoctor < ActiveRecord::Migration[6.1]
  def change
    remove_column :doctors, :specialty, :string
  end
end
