require_relative ('../db/sql_runner')

class Tag

  attr_reader :id
  attr_accessor :category

  def initialize( options )
    @id = options['id'].to_i unless options['id'].nil?
    @category = options['category']
  end

  def save()
    sql = "
      INSERT INTO tags (category) VALUES ('#{@category}')
      RETURNING *;
      "
    @id = SqlRunner.run( sql )[0]['id'].to_i
  end

  def self.all()
    sql = "
      SELECT * FROM tags;
    "
    tags = Tag.get_many( sql )
  end

  def self.delete_all()
    sql = "
      DELETE FROM tags;
    "
    SqlRunner.run( sql )
  end












  def self.get_many( sql )
    return SqlRunner.run( sql ).map { |tag| Tag.new(tag) }
  end

end