number = rand(10)
while (chosen = gets.to_i) != number
   puts  "too high" if chosen >number
   puts "too low" if chosen < number
end
puts " number is #{number}"
