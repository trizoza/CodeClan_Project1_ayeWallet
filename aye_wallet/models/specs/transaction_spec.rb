require ('minitest/autorun')
require_relative ('../transaction')

class TransactionSpec < MiniTest::Test

  def setup()
    @transaction01 = Transaction.new({"item" => "Saturday shopping", "merchant" => "Tesco", "value" => 30})
  end

  def test_transaction_item()
    assert_equal("Saturday shopping", @transaction01.item())
  end

  def test_transaction_merchant()
    assert_equal("Tesco", @transaction01.merchant())
  end

  def test_transaction_value()
    assert_equal(30, @transaction01.value())
  end

end