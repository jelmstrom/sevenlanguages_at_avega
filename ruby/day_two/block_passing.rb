class Tree

	attr_accessor :name, :children

	def initialize(hash, *name) 
		@children =[]
		if(name.size ==0)
			hash.each do 
				|k,v|
				name=k
				hash=v
			end	
		end
		@name=name
		hash.each {|k2,v2| @children.push(Tree.new(v2,k2))}
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

