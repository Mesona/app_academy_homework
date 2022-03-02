class Stack

  def initialize
    @stack_storage = []
  end

  def push(el)
    @stack_storage << el
  end

  def pop
    @stack_storage.pop
  end

  def peek
    @stack_storage.last
  end
end

class Queue

  def initialize
    @queue_storage = []
  end

  def enqueue(el)
    @queue_storage << el
  end

  def dequeue
    @queue_storage.shift
  end

  def peek
    @queue_storage.first
  end
end

class Map

  def initialize
    @map_storage = []
  end

  def set(key, value)
    if @map_storage == []
      @map_storage << [key, value]
    else# @map_storage.include?([key, value])
      exist = false
      @map_storage.each_with_index do |el, idx|
        if el[0] == key
          @map_storage[idx] = [key, value]
          exist = true
        end
      end
    end
    if exist == false
      @map_storage << [key, value]
    end
    @map_storage
  end

  def get(key)
    @map_storage.each_with_index do |el, idx|
      if el.first == key
        return self.show[idx]
      end
    end
  end

  def delete(key)
    @map_storage.each_with_index do |el, idx|
      if el.first == key
        @map_storage.delete_at(idx)
      end
    end
  end

  def show
    @map_storage
  end

end