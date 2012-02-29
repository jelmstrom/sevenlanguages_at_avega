class Fixnum
	def times
		
		 self.downto(1) {yield}
	end
end

3.times {puts 'my own'}
