def say_something (options ={})
	puts 'hello' if options[:stuff] == 0
	
end

say_something(:stuff => 0)
say_something(:stuff => 1)

