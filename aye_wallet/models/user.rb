class User

  attr_accessor :budget

  def initialize( options )
    @budget = options['budget'].to_f
  end

end