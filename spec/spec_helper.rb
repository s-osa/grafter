require "grafter"

class Sample
  def initialize(*args)
    raise unless args[0]
    @value    = args.shift
    @children = [Sample.new(*args)] if args[0]
  end

  attr_accessor :value
  attr_accessor :children

  def inspect
    children_status =  @children ? ", children:#{@children}" : nil
    "<Sample: value:#{@value}#{children_status}>"
  end
  alias_method :to_s, :inspect

  def ===(other)
    self.value == other.value
  end
end

