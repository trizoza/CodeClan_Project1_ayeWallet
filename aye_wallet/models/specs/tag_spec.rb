require ('minitest/autorun')
require_relative ('../tag')

class TagSpec < MiniTest::Test

  def setup()
    @tag01 = Tag.new({"category" => "food"})
    @tag02 = Tag.new({"category" => "travel"})
    @tag03 = Tag.new({"category" => "sport"})
    @tag04 = Tag.new({"category" => "household"})
    @tag05 = Tag.new({"category" => "entertainment"})
    @tag06 = Tag.new({"category" => "health"})
    @tag07 = Tag.new({"category" => "clothing"})
    @tag08 = Tag.new({"category" => "family"})
    @tag09 = Tag.new({"category" => "car"})
    @tag10 = Tag.new({"category" => "other"})
  end

  def test_tag_category()
    assert_equal("food", @tag01.category())
  end

end