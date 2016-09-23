def windowed_max_range1(arr, window)
  current_max = nil

  (0..arr.length-window).each do |i|
    window_arr = arr[i...i+window]
    temp_max = window_arr.max - window_arr.min
    current_max ||= temp_max
    current_max = temp_max if temp_max > current_max
  end
  return current_max
end

def windowed_max_range(arr,window)
  stackqueue = StackQueue.new
  current_max = nil

  until stackqueue.size == window
    stackqueue.enqueue(arr.shift)
  end
  current_max ||= stackqueue.max - stackqueue.min

  until arr.empty?
    stackqueue.dequeue
    stackqueue.enqueue(arr.shift)
    diff = stackqueue.max - stackqueue.min
    current_max = diff if diff > current_max
  end
  return current_max
end

class MyStack
  def initialize
    @store = []
    @max_store = []
    @min_store = []
  end

  def push(el)
    @store.push(el)
    if @max_store.empty? || el > max
      @max_store.push(el)
    elsif (el < max)
      @max_store.push(max)
    end

    if @min_store.empty? || el < min
      @min_store.push(el)
    elsif (el > min)
      @min_store.push(min)
    end

  end

  def max
    return @max_store.last
  end

  def min
    return @min_store.last
  end

  def pop
    @max_store.pop
    @min_store.pop
    return @store.pop
  end

  def peek
    return @store.last
  end

  def size
    return @store.size
  end

  def empty?
    return @store.empty?
  end
end

class StackQueue
  def initialize
    @enqueue_store = MyStack.new
    @dequeue_store = MyStack.new
  end

  def enqueue(el)
    @enqueue_store.push(el)
  end
  def dequeue
    if @dequeue_store.empty?
      until @enqueue_store.empty?
        @dequeue_store.push(@enqueue_store.pop)
      end
    end
    @dequeue_store.pop
  end

  def max
    max_e = @enqueue_store.max
    max_d = @dequeue_store.max
    return max_e if @dequeue_store.empty?
    return max_d if @enqueue_store.empty?
    return max_e > max_d ? max_e : max_d
  end

  def min
    min_e = @enqueue_store.min
    min_d = @dequeue_store.min
    return min_e if @dequeue_store.empty?
    return min_d if @enqueue_store.empty?
    return min_e < min_d ? min_e : min_d
  end

  def size
    return @enqueue_store.size+@dequeue_store.size
  end
  def empty
    return @enqueue_store.empty? && @dequeue_store.empty?
  end
end
# def MyQueue
#   def initialize
#     @store = []
#   end
#
#   def enqueue
# end

puts windowed_max_range([1, 0, 2, 5, 4, 8], 2)== 4 # 4, 8
puts windowed_max_range([1, 0, 2, 5, 4, 8], 3)== 5 # 0, 2, 5
puts windowed_max_range([1, 0, 2, 5, 4, 8], 4)== 6 # 2, 5, 4, 8
puts windowed_max_range([1, 3, 2, 5, 4, 8], 5)== 6
