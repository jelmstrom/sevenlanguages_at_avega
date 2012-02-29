a = (1..16).to_a.each {|val|puts "#{val-3}, #{val-2}, #{val-1}, #{val}" if val%4==0}

puts "--------------------------"

b = (1..16).to_a.each_slice(4) {|splice| p splice}

