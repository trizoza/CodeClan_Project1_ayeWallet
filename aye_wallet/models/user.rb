require_relative ('../db/sql_runner')

class User

  attr_accessor :budget

  def initialize( options )
    @budget = options['budget'].to_f
  end

  def self.check_budget()
    sql = "
      SELECT * FROM users;
    "
    return SqlRunner.run( sql )[0]['budget'].to_f
  end

end