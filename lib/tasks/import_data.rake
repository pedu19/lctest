require "csv"
namespace :import_data do
  desc "Import data into the database"
  task(:into_vic_lga => :environment) do
    CSV.foreach("#{ Rails.root }/db/files/data.csv", :col_sep => ",", :headers => true) do |row|
      @vic_lga = VicLga.new
     
      @vic_lga.gid = row[0] #gid
      @vic_lga.pfi = row[1] #pif
      @vic_lga.lga_code = row[2] #lga_code
      @vic_lga.lga_name = row[3] #lga_name
      @vic_lga.gaz_lga = row[4] #gaz_lga
      @vic_lga.gazregn = row[5] #gazregn
      @vic_lga.abslgacode = row[6] #abslgacode
      @vic_lga.pfi_cr = row[7] #pfi_cr
      @vic_lga.ufi = row[8] #ufi
      @vic_lga.ufi_cr = row[9] #ufi_cr,
      @vic_lga.ufi_old = row[10] #ufi_old
      @vic_lga.geom = row[11] #geom
      @vic_lga.save
      puts "#{@vic_lga}"
    end
  end

  task(:update_geom => :environment) do
    CSV.foreach("#{ Rails.root }/db/files/data.csv", :col_sep => ",", :headers => true) do |row|
      @vic_lgas = VicLga.all
      @vic_lgas.each do|vl|
        vl.update_attribute(:geom, row[11])
      end
    end
  end
end