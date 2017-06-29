require './heap.rb'
class MinHeap < Heap

  attr_accessor :min

  def extract
    super { sift_down_min(0) }
  end

  def add(i)
    super { sift_up_min(container.length - 1) }
  end

  def sift_down_min(i)
    return if i*2 >= container.length - 1
    left = i*2 + 1
    right = i*2 + 2
    min = i
    min = right if right < container.length && container[right] < container[i]
    min = left if container[left] < container[min]   
    return if min == i
    container[i], container[min] = container[min], container[i]
    sift_down_min(min)
  end

  def sift_up_min(i)
    return if i == 0
    parent = (i - 1) / 2
    return if container[parent] <= container[i]
    container[parent], container[i] = container[i], container[parent]
    sift_up_min(parent)
  end

  def min
    container[0]
  end

end