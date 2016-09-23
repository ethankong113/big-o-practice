# def my_min(list)
#   min = list.first
#   list.each do |el1|
#     min = el1 if list.all? {|el2| el1 <= el2}
#   end
#   min
# end
# O(n^2)

def my_min(list)
  min = list.first
  list.each do |el|
    min = el if el < min
  end
  min
end

# O(n)

def subsum(list)
  arr = []
  list.each_with_index do |el, i|
    (i...list.length).each do |j|
      arr << list[i..j]
    end
  end

  max = arr.first.reduce(:+)
  arr.each do |subarray|
    max = subarray.reduce(:+) if subarray.reduce(:+) > max
  end
  max
end

def subsum2(list)
  largest_sum = list.first
  rolling_sum = 0
  list.each do |el|
    rolling_sum += el
    if rolling_sum > largest_sum
      largest_sum = rolling_sum
    end
    if rolling_sum < 0
      rolling_sum = 0
    end
  end
  return largest_sum
end
