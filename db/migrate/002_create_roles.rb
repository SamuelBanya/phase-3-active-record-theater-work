class CreateRoles < ActiveRecord::Migration[6.1]
  has_many auditions
  def change()
    create_table :auditions do |t|
      t.string :character_name
    end
  end
end
