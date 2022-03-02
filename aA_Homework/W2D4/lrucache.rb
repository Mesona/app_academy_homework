class LRUCache
  
  def initialize(limit)
    @limit = limit
    @cache = []
    @head = []
    @foot = []
  end

  def count
    cache.length
    # returns number of elements currently in cache
  end

  def add(el)
    # if cache.first == nil
    if cache.include?(el)
      cache.delete(el)
      cache << el
    elsif @cache.length < @limit
      cache << el
    else
      cache.shift
      cache << el
    end
    return "Added"
    # adds element to cache according to LRU principle
  end

  def show
    p cache
    # shows the items in the cache, with the LRU item first
  end

  # def [](key)
  #   self[key] = self.[](key)
  # end

  private
  attr_reader :cache

  def inspect
    self.object_id
  end

  def include?(item)
    @cache.each do |i|
      if item == i
        return true
      end
    end
  end
  # helper methods go here!

end


if __FILE__ == $PROGRAM_NAME
  load 'lrucache.rb'
  johnny_cache = LRUCache.new(4)

  johnny_cache.add("I walk the line")
  johnny_cache.add(5)

  johnny_cache.count # => returns 2

  johnny_cache.add([1,2,3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1,2,3,4])
  johnny_cache.add("I walk the line")
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add("I walk the line")
  johnny_cache.add({a: 1, b: 2, c: 3})

  johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]

end