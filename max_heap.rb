require './heap.rb'
class MaxHeap < Heap

  def extract
    super { sift_down_max(0) }
  end

  def add(i)
    super { sift_up_max(container.length - 1) }
  end

  def sift_down_max(i)
    return if i*2 >= container.length - 1
    left = i*2 + 1
    right = i*2 + 2
    max = i
    max = right if right < container.length && container[right] > container[i]
    max = left if container[left] > container[max]   
    return if max == i
    container[i], container[max] = container[max], container[i]
    sift_down_max(max)
  end

  def sift_up_max(i)
    return if i == 0
    parent = (i - 1) / 2
    return if container[parent] >= container[i]
    container[parent], container[i] = container[i], container[parent]
    sift_up_max(parent)
  end

  def max
    container[0]
  end
end
