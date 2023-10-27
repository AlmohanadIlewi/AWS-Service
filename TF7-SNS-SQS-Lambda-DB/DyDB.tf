resource "aws_dynamodb_table" "myDB" {
  name           = "my-table2"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "Id"

  attribute {
    name = "Id"
    type = "S"
  }
}

resource "random_id" "example_id" {
  byte_length = 8
}

resource "random_pet" "example_file_name" {
  length = 2
}

resource "aws_dynamodb_table_item" "myDB" {
  table_name = aws_dynamodb_table.myDB.name
  hash_key   = aws_dynamodb_table.myDB.hash_key

  item = jsonencode({
    "Id": {
      "S": random_id.example_id.hex  # Use "S" for string data type
    },
    "FileName": {
      "S": random_pet.example_file_name.id  # Use "S" for string data type
    },
    "Timestamp": {
      "S": "2023-10-27T12:00:00"  # You can adjust the date as needed
    },
    "Size": {
      "N": "1024"  # Use "N" for number data type
    },
    "Tags": {
      "SS": ["tag1", "tag2", "tag3"]  # Use "SS" for a string set data type
    },
    "IsProcessed": {
      "BOOL": true  # Use "BOOL" for boolean data type
    }
  })
}


# resource "aws_dynamodb_table_item" "myDB" {
#   table_name = aws_dynamodb_table.myDB.name
#   hash_key   = aws_dynamodb_table.myDB.hash_key

#   item = <<ITEM
# {
#   "my-table": {"S": "something"},
#   "one": {"N": "11111"},
#   "two": {"N": "22222"},
#   "three": {"N": "33333"},
#   "four": {"N": "44444"}
# }
# ITEM
# }

