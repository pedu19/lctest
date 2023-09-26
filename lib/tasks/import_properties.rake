require "json"
namespace :import_data do
  desc "Import data into the database"
  task(:into_property => :environment) do
    @properties = JSON.parse(File.read("#{ Rails.root }/db/files/properties.json"))

    @properties.each do |property|
      # binding.pry
      Property.create!(property.to_h)
      puts "#{Property.last.full_address}"
    end
  end
end