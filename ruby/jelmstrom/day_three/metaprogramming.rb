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
      @csvContents=[]
      fileName = self.class.to_s.downcase + '.txt'
      file = File.new(fileName)
      headers = file.gets.chomp.split(",")
      file.each do|line|
        row = line.chomp.split(",")
        hash = { }
        row.each do |item|
		key = headers[row.index(item)]
                hash[key.to_s] = item 
            end
    	@csvContents.push(Row.new(hash))
    end
 end

   attr_accessor :csvContents

    def each(&block)
        @csvContents.each &block
    end    

    def initialize
      read
    end
  end
end

class Row 
  attr_accessor :hash
  def initialize(value)
     @hash = value
  end	

  def method_missing(name, *args) 
     hash[name.to_s]
  end
end

class ReadCsv 
  include ActsAsCsv
  acts_as_csv
end

reader = ReadCsv.new
reader.each {|row| p " #{row.title} - #{row.length}"}
