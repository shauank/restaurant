def add(a,b)
   a + b
end

def multi(a,b)
   a * b
end

def math_operation(fn , a, b)
  a.send(fn, b)
end

# puts add(1,3)
# puts multi(1,3)

# puts math_operation(:+, 1, 3)
# puts math_operation(:*, 1, 3)

apply_math = lambda do |fn, a, b, c|
  # puts a
  # puts b
  # puts fn
  a.send(fn,b).send(fn, c)
end

  


add_curry = apply_math.curry.(:+)
multi_curry = apply_math.curry.(:*)

# puts add_curry.(1,3)
# puts multi_curry.(1,3)

# puts add_curry.class

increment_curry = add_curry.(1)

puts increment_curry.(1).(1)
# increment_curry.(1)
# puts fn_add.call

# def sum_int(a,b)
#   s = 0
#   a.upto(b) { |n| s+= n }
#   s
# end

sum_int = lambda do |f,a,b|
  s = 0
  a.upto(b) { |n| s+= f.(n) }
  s
end

# puts sum_int.(lambda{|x| 2**x }, 1,3)



currying = sum_int.curry
sum_ints = currying.(lambda {|x| x **2 })

# puts sum_ints.(1,3)
   