class Array
  def graft(args={})
    branch, operator = args[:branch].to_sym, (args[:operator].to_sym || :===)
    check_response_in_graft(branch,operator)

    base_trees = self
    base_trees.each do |base_tree|
      graftable_trees = base_trees.select{|obj| base_tree.send(operator,obj) && !base_tree.equal?(obj) }
      graftable_trees.each do |graftable_tree|
        base_tree.send(branch).concat(graftable_tree.send(branch))
        base_trees.delete(graftable_tree)
      end
    end
    base_trees
  end

  private

  def check_response_in_graft(*methods)
    methods.each do |method|
      self.each do |obj|
        raise NoMethodError, "#{obj.class}##{method} is not defined" unless obj.respond_to?(method)
      end
    end
  end
end
