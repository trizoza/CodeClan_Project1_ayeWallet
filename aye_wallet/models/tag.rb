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

  def self.destroy(id)
    sql = "
      DELETE FROM tags where id = #{id};
    "
    SqlRunner.run( sql )
  end

  def self.find( id )
    sql = "
      SELECT * FROM tags WHERE id=#{id};
      "
    tag = SqlRunner.run( sql )[0]
    return Tag.new( tag )
  end

  def self.update( options )
    sql = "
      UPDATE tags SET
      category='#{options['category']}'
      WHERE id=#{options['id']};
      "
    SqlRunner.run( sql )
  end

  def self.get_many( sql )
    return SqlRunner.run( sql ).map { |tag| Tag.new(tag) }
  end

end