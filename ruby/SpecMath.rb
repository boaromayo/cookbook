#======================================================
# ** SpecMath
#------------------------------------------------------
#  Custom Numeric class for easy number manipulation.
#======================================================

class SpecMath
	attr_accessor :num	# Quicker way of accessing (setting/getting) class properties

	# CONSTRUCTOR FOR SpecMath(num).
	def initialize(num)
		@num = num
	end
	
	#--------------------
	# * Set Num
	#--------------------
	def num=(a)
		@num = a # Typed as var.num=(num)
	end
	
	#-------------------
	# * Get Num
	#-------------------
	def num
		@num # "return" key term optional
	end
	
	def add(a)
		@num += a
	end
	
	def subtract(a)
		@num -= a
	end
	
	def mult(a)
		@num *= a
	end
	
	def div(a)
		@num = (a == 0) ? @num : (@num / a)
	end
	
	def mod(a)
		@num = (a == 0) ? @num : (@num % a)
	end
	
	def is_even
		@num.to_i % 2 == 0
	end
	
	def is_odd
		!(@num.to_i % 2 == 0)
	end
	
	def is_prime
		if (@num.to_i % 2 != 0 && @num.to_i != 2)
			return true
	end
	
	def plusone
		@num += 1
	end
	
	def minusone
		@num -= 1
	end
	
	def int
		@num = @num.to_i
	end
	
	def float
		@num = @num.to_f
	end
end