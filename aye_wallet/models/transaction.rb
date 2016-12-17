require_relative ('../db/sql_runner')

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
    tags = Tag.get_many( sql )
  end

  def self.delete_all()
    sql = "
      DELETE FROM transactions;
    "
    SqlRunner.run( sql )
  end












  def self.get_many( sql )
    return SqlRunner.run( sql ).map { |transaction| Transaction.new(transaction) }
  end

end