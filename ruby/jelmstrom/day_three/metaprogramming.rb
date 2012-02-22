module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end
  
  
  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
 
    def read
      @csvContents = []
      fileName = self.class.to_s.downcase + '.txt'
      file = File.new(fileName)
      @headers = file.gets.chomp.split(',')
   
      file.each do|row|
        @csvContents << row.chomp.split(',')
      end
    end

    attr_accessor :headers, :csvContents
    

    def method_missing(name, *args)
      puts @csvContents[@headers.index name.to_s]
    end
    def initialize
      read
    end
  end
end

class ReadCsv 
  include ActsAsCsv
  acts_as_csv
end

reader = ReadCsv.new
puts reader.title
puts reader.length
