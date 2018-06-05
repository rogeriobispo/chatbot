class CreateLink < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :url
      t.integer :company_id
    end
  end
end
