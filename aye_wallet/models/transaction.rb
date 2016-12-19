require_relative ('../db/sql_runner')
require_relative ('user')
require_relative ('tag')

class Transaction

  attr_reader :id, :tag_id
  attr_accessor :item, :value, :merchant

  def initialize( options )
    @id = options['id'].to_i unless options['id'].nil?
    @item = options['item']
    @value = options['value'].to_f
    @merchant = options['merchant']
    @tag_id = options['tag_id'].to_i
  end

  def save()
    sql = "
      INSERT INTO transactions (item, value, merchant, tag_id) VALUES ('#{@item}', #{@value}, '#{@merchant}', #{@tag_id})
      RETURNING *;
      "
    @id = SqlRunner.run( sql )[0]['id'].to_i
  end

  def self.all()
    sql = "
      SELECT * FROM transactions;
    "
    return Transaction.get_many( sql )
  end

  def self.total_spent()
    sql = "
      SELECT * FROM transactions;
    "
    total_spent = SqlRunner.run( sql ).map { |transaction| Transaction.new(transaction).value }
    total_spent = total_spent.inject(:+)
    return total_spent.to_f
  end

  def self.total_spent_by_tag(id)
    sql = "
      SELECT * FROM transactions
      WHERE tag_id = #{id};
    "
    total_spent_by_tag = SqlRunner.run( sql ).map { |transaction| Transaction.new(transaction).value }
    total_spent_by_tag = total_spent_by_tag.inject(:+)
    return total_spent_by_tag.to_f
  end

  def tag()
    sql = "
      SELECT * FROM tags
      WHERE id = #{tag_id};
    "
    tag = SqlRunner.run( sql ).first()
    return Tag.new( tag )
  end

  def self.delete_all()
    sql = "
      DELETE FROM transactions;
    "
    SqlRunner.run( sql )
  end

  def self.destroy(id)
    sql = "
      DELETE FROM transactions where id = #{id};
    "
    SqlRunner.run( sql )
  end

  def self.find( id )
    sql = "
      SELECT * FROM transactions WHERE id=#{id};
      "
    transaction = SqlRunner.run( sql )[0]
    return Transaction.new( transaction )
  end

  def self.update( options )
    sql = "
      UPDATE transactions SET
      item='#{options['item']}',
      value='#{options['value']}',
      merchant='#{options['merchant']}',
      tag_id='#{options['tag_id']}'
      WHERE id='#{options['id']}';
      "
    SqlRunner.run( sql )
  end

  def self.get_many( sql )
    return SqlRunner.run( sql ).map { |transaction| Transaction.new(transaction) }
  end

end