require_relative('../models/tag')
require_relative('../models/transaction')
require_relative('../models/user')
require ('pry')

Tag.delete_all()
Transaction.delete_all()

tag01 = Tag.new({"category" => "food"})
tag01.save()
tag02 = Tag.new({"category" => "travel"})
tag02.save()
tag03 = Tag.new({"category" => "sport"})
tag03.save()
tag04 = Tag.new({"category" => "household"})
tag04.save()
tag05 = Tag.new({"category" => "entertainment"})
tag05.save()
tag06 = Tag.new({"category" => "health"})
tag06.save()
tag07 = Tag.new({"category" => "clothing"})
tag07.save()
tag08 = Tag.new({"category" => "family"})
tag08.save()
tag09 = Tag.new({"category" => "car"})
tag09.save()
tag10 = Tag.new({"category" => "other"})
tag10.save()

transaction01 = Transaction.new({ "item" => "Saturday shopping", "merchant" => "Tesco", "value" => 22.47, "tag_id" => tag01.id() })
transaction01.save()
transaction02 = Transaction.new({ "item" => "beers", "merchant" => "Chanters", "value" => 8, "tag_id" => tag05.id() })
transaction02.save()
transaction03 = Transaction.new({ "item" => "pizza", "merchant" => "Dominos", "value" => 9.99, "tag_id" => tag01.id() })
transaction03.save()
transaction04 = Transaction.new({ "item" => "Christmas presents", "merchant" => "Amazon", "value" => 30, "tag_id" => tag08.id()})
transaction04.save()
transaction05 = Transaction.new({ "item" => "jumper", "merchant" => "Primark", "value" => 8.49, "tag_id" => tag07.id()})
transaction05.save()




binding.pry
nil