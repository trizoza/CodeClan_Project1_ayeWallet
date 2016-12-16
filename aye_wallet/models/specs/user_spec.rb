require ('minitest/autorun')
require_relative ('../user')

class UserSpec < MiniTest::Test

  def setup()
    @user = User.new({"budget" => 500})
  end

  def test_user_budget()
    assert_equal(500, @user.budget())
  end

end