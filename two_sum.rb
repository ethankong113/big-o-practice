require 'byebug'

def two_sum_b?(arr,target)
  (0...arr.length-1).each do |i|
    (i+1...arr.length).each do |j|
      return true if arr[i] + arr[j] == target
    end
  end
  false
end

def two_sum_s?(arr,target)
  arr_sorted = arr.sort
  arr_sorted.each_with_index do |el,i|
    res = arr.bsearch_index{|x| x == target-el}
    return true if  res != i && res != nil
  end
  return false
end

# def two_sum_h?(arr,target)
#   arr_count = Hash.new {|h,k| h[k] = []}
#   arr.each_with_index do |num,i|
#     arr_count[num] << i
#     return true if arr_count[target-num].empty? && arr_count[num] != [i]
#   end
#   return false
# end
#
# [0] = [0]
# [1] = [1]
# [5] = [2]

def two_sum_h?(arr,target)
  arr_count = Hash.new {|h,k| h[k] = nil}
  arr.each_with_index do |num,i|
    arr_count[num] = i
  end
  arr.each_with_index do |num, i|
    j = arr_count[target - num]
    return true if !j.nil? && i != j
  end
  false
end
