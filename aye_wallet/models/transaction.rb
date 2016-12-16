require_relative ('../db/sql_runner')

class Transaction

  attr_reader :id, :tag_id
  attr_accessor :value, :merchant

  def initialize( options )
    @id = options['id'] unless options['id'].nil?
    @value = options['value']
    @merchant = options['merchant']
    @tag_id = options['tag_id']
  end

end