class Heap
  attr_accessor :container

  def initialize(ar = [])
    self.container = []
    heapify(ar)
  end

  def extract
    return container.pop if container.length <= 1
    top = container[0]
    container[0] = container.pop 
    yield
    top
  end

  def replace(i)
    extract
    add(i)
  end

  def add(i)
    container << i
    yield
  end

  def size
    container.length
  end

  def empty?
    container.empty?
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
