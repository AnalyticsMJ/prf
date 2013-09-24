require 'archive/zip'

zip_files = Dir["./data/*.zip"]
destination = "./temp/"


def unzip_all(files, params)
  files.each do |filename|
    puts "Extracting #{filename}"
    Archive::Zip.extract(filename, params[:to], :directories=>false, :overwrite => :older)
  end
  
end

unzip_all zip_files, to: destination
