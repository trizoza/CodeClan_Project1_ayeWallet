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

  def self.update_budget( options )
    sql = "
      UPDATE users SET
      budget = #{options['budget']}
      WHERE id = 1;
      "
    SqlRunner.run( sql )
  end

  def self.find( id )
    sql = "
      SELECT * FROM users WHERE id = #{id};
      "
    user = SqlRunner.run( sql )[0]
    return User.new( user )
  end

end