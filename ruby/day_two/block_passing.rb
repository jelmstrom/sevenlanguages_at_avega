class Tree

	attr_accessor :name, :children

	def initialize(hash) 
		@name=hash.keys.first
		puts "hash value = #{hash.values} <-"
		@children =  hash.values.first.map {|key, value| Tree.new(key=>value) }
	end
	
	def  visit_all(&block)
		visit &block
		children.each {|val| val.visit_all  &block}
	end

	def visit(&block)
		block.call self
	end

end

tree_instance = Tree.new('grandpa'=>{'-childlessChild'=>{}, '-childWithOneChild'=>{'--grandChildWithTwoChildren'=>{'---greatGrandChild'=>{}, '---greatGrandchild2'=>{}}}, '-child2withOneChild'=>{'--grandchildWithOneChild' =>{'---greatGrandChild3'=>{}}}})
tree_instance.visit_all { |the_tree| puts "#{the_tree.name}, #{the_tree.children.size}"}

