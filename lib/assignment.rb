require 'open-uri' 
class Assignment
  attr_accessor :filename
  
  def initialize(filename)
    @filename = File.expand_path(".././lib/data/#{filename}")
    readData
  end
  
  def readData
    begin
      raise "File Not Found Exception" unless File.exists? ("#{@filename}.txt")
      File.open("#{@filename}.txt", 'r') do |f1|  
        while line = f1.gets
          puts "Downloading: " + line
          downloader(line.strip)
        end
      end
    rescue Exception => e
      raise e
    end
  end
  
  def downloader(url)
   begin
      Dir.mkdir('images') unless File.exists? File.expand_path('.././lib/images')
      open(url) do |u| 
        File.open(File.join(File.expand_path(".././lib/images/"), url.split('/')[-1]), 'wb') { |f| f.write(u.read) } 
      end
   rescue Exception => e
     raise e
   end
  end
end

a= Assignment.new("inputData")