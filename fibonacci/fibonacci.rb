# Write a method #fibs which takes a number and returns that many members of the fibonacci sequence. Use iteration for this solution.
def fibs(n)
  num1 = 0
  num2 = 1

  n.times do
    next_num = num1 + num2
    num1 = num2
    num2 = next_num
    puts next_num
  end
end

fibs(1) #0
fibs(6) #0, 1, 1, 2, 3, 5
fibs(10) #0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89

#Now write another method #fibs_rec which solves the same problem recursively. This can be done in just 3 lines (or 1 if you're crazy, but don't consider either of these lengths a requirement... just get it done).

def fibs(n)
  return 0 if n == 0
  return 1 if n == 1
  fibs(n-1) + fibs(n-2)
end
p fibs(1) #0
p fibs(6) #0, 1, 1, 2, 3, 5
p fibs(10) #0, 1, 1, 2, 3, 5, 8, 13, 21, 34
