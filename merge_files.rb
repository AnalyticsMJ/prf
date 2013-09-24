require 'rubygems'
require 'zip/zip'

zipFiles = Dir["./data/*.zip"]
destination = "./temp/"
 
def unzip_file (file, destination)
  Zip::ZipFile.open(file) { |zip_file|
   zip_file.each { |f|
     f_path=File.join(destination, f.name)
     FileUtils.mkdir_p(File.dirname(f_path))
     zip_file.extract(f, f_path) unless File.exist?(f_path)
   }
  }
end


def unzip_all()
  zipFiles.each do |filename|
    unzip_file filename destination    
  end
  
end

unzip_all

# 
# 
# tabelas = ["ocorrencia" ,"ocorrenciaacidente", "ocorrenciaPessoa", "pessoa"]    
#  
# tabelas.each do |tabela|
#   File.open("#{tabela}_all.csv", 'w') do |output|
#     [2007,2008,2009,2010,2011,2012].each do |ano|
#       [1,2].each do |semestre|
#         read =File.readlines("BRBRASIL/brbrasil_#{semestre}_semestre_#{ano}/#{tabela}_#{semestre}_Semestre_#{ano}.csv")
#         output << read    
#       end
#     end
#   end  
# end
