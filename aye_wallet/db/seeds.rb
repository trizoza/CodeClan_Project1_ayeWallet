require_relative('../models/tag')
require_relative('../models/transaction')
require_relative('../models/user')
require ('pry')

Transaction.delete_all()

transaction01 = Transaction.new({ "item" => "Saturday shopping", "merchant" => "Tesco", "value" => 22.47, "tag_id" => 1 })
transaction01.save()
transaction02 = Transaction.new({ "item" => "beers", "merchant" => "Chanters", "value" => 8, "tag_id" => 9 })
transaction02.save()
transaction03 = Transaction.new({ "item" => "pizza", "merchant" => "Dominos", "value" => 9.99, "tag_id" => 1 })
transaction03.save()
transaction04 = Transaction.new({ "item" => "Christmas presents", "merchant" => "Amazon", "value" => 30, "tag_id" => 12 })
transaction04.save()
transaction05 = Transaction.new({ "item" => "jumper", "merchant" => "Primark", "value" => 8.49, "tag_id" => 2 })
transaction05.save()

binding.pry
nil