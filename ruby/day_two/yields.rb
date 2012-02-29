class Yielder
 def with_yield
  yield(self) if block_given?
 end

 def with_block(&block)
  instance_eval(&block)
 end
end

y = Yielder.new

y.with_yield do |arg|
        p arg
        p self 
      end

y.with_block do |arg|
        p arg
        p self
      end

