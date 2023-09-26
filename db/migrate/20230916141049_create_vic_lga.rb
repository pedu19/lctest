class CreateVicLga < ActiveRecord::Migration[7.0]
  def change
    create_table :vic_lgas, schema: 'public' do |t|
      t.integer :gid
      t.string :pfi, limit: 10
      t.string :lga_code, limit: 4
      t.string :lga_name, limit: 45
      t.string :gaz_lga, limit: 45
      t.string :gazregn, limit: 20
      t.string :abslgacode, limit: 6
      t.datetime :pfi_cr
      t.bigint :ufi
      t.datetime :ufi_cr
      t.bigint :ufi_old

      t.timestamps
    end
  end
end
