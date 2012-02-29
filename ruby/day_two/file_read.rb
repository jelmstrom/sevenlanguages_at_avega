class FileReaderLab
	attr_accessor :filename

	def initialize(name)
		@filename=name
	end

	def printLinesMatching(*expression)
		File.open(filename).each_line  {|line| puts "#{$.} #{line}" if line =~ /#{expression}/}	
	end
end

puts("--------------")
FileReaderLab.new("file_read.rb").printLinesMatching
puts("--------------")
puts("--------------")
FileReaderLab.new ("block_passing.rb").printLinesMatching ("&block")
