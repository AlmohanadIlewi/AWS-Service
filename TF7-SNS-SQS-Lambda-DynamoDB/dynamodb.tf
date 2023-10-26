resource "aws_dynamodb_table" "myDB" {
  name           = "myfile"
  read_capacity  = 10
  write_capacity = 10
  hash_key       = "myfile"

  attribute {
    name = "myfile"
    type = "S"
  }
}


# resource "aws_dynamodb_table_item" "myDB" {
#   table_name = aws_dynamodb_table.myDB.name
#   hash_key   = aws_dynamodb_table.myDB.hash_key

#   item = <<ITEM
# {
#   "myfile": {"S": "something"},
#   "one": {"N": "11111"},
#   "two": {"N": "22222"},
#   "three": {"N": "33333"},
#   "four": {"N": "44444"}
# }
# ITEM
# }

