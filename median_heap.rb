require './min_heap'
require './max_heap'

class MedianHeap
  attr_accessor :min_heap, :max_heap

  def initialize(ar = [])
    self.min_heap = MinHeap.new
    self.max_heap = MaxHeap.new
    heapify(ar)
  end

  def balance_heaps
    if min_heap.size - max_heap.size > 1
      max_heap.add(min_heap.extract)
    elsif max_heap.size - min_heap.size > 1
      min_heap.add(max_heap.extract)
    end
  end

  def add(i)
    if i > median
      min_heap.add(i)
    else
      max_heap.add(i)
    end
    balance_heaps
  end

  def median
    return 0 if empty?
    if min_heap.size > max_heap.size
      min_heap.min / 1.0
    elsif max_heap.size > min_heap.size
      max_heap.max / 1.0
    else
      (min_heap.min + max_heap.max) / 2.0
    end
  end

  def empty?
    size == 0
  end

  def size
    min_heap.size + max_heap.size
  end

  private

  def heapify(ar)
    i = 0
    while i < ar.length
      add(ar[i])
      i += 1
    end
  end
end
