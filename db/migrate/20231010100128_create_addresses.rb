class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :cep
      t.string :street
      t.integer :number
      t.string :complement
      t.string :neighborhood
      t.string :city
      t.string :state
      t.references :recruiter_profile, null: false, foreign_key: true
      t.references :applicant_profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
