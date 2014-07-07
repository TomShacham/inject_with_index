class Array
	def inject_with_index acc=nil, &blk
		acc = acc.nil? ? self.shift : acc
		self.each_with_index { |el, i| acc = yield(acc, el, i) }; acc
	end
end