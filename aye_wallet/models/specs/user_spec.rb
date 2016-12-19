require ('minitest/autorun')
require_relative ('../user')

class UserSpec < MiniTest::Test

  def setup()
    @user = User.new({"budget" => 500})
  end

  def test_user_budget()
    assert_equal(500, @user.budget())
  end

  def test_set_budget()
    @user.set_budget(300)
    assert_equal(300, @user.budget)
  end

end