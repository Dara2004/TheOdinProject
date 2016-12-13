#> bubble_sort([4,3,78,2,0,2])
# => [0,2,2,3,4,78]
def bubble_sort(arr)
  n = -2      #w the range [0..-1] arr[idx + 1] will be nil => error => n must start from -2
  until arr[n].nil? do
    arr[0..n].each_index do |idx|
      if arr[idx] > arr[idx + 1]
        arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx] #swap
      end
    end
    n = n - 1
  end
  p arr
end

bubble_sort([4,3,78,2,0,2])
bubble_sort([34, 54, 65, 76, 7, 1])
bubble_sort([12, 43, 5, 6, 79, 0])
# [0, 2, 2, 3, 4, 78]
# [1, 7, 34, 54, 65, 76]
# [0, 5, 6, 12, 43, 79]
# for each el in the arr, swap w the one on the right if it's bigger
# exclude the last el after each pass
# go back to the 1st el, repeat the process and stop when every el is excluded (all passes are done)
