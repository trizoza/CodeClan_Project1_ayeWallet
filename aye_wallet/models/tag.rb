require_relative ('../db/sql_runner')

class Tag

  attr_reader :id
  attr_accessor :category

  def initialize( options )
    @id = options['id'] unless options['id'].nil?
    @category = options['category']
  end

end