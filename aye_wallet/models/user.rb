require_relative ('../db/sql_runner')

class User

  attr_accessor :budget, :total_spent, :total_spent_by_tag

  def initialize( options )
    @budget = options['budget'].to_f
    @total_spent = options['total_spent'].to_f || 0
    @total_spent_by_tag = options['total_spent_by_tag'].to_f || 0
  end

end