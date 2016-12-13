# create med bubble_sort_by which sorts an arr but accepts a block.
# The block should take two arguments which represent the two elements currently being compared.
# Expect that the block's return will be similar to the spaceship operator. if the result of the block is negative, the element on the left is "smaller" than the element on the right. 0 means they are equal. A positive result means the left element is greater. Use this to sort your array.

def bubble_sort_by(arr)
  n = -2
  until arr[n].nil? do
    arr[0..n].each_index do |idx|
      if arr[idx].length > arr[idx + 1].length
        arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx] #swap
      end
    end
    n = n - 1
  end
  p arr
end

bubble_sort_by(["hi", "hello", "hey"])
bubble_sort_by(["one", "five", "one-hundred", "zero", "two"])
# ["hi", "hey", "hello"]
# ["one", "two", "five", "zero", "one-hundred"]
