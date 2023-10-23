output "instance_id" {
    value = {
        value1 = aws_instance.EC1.id
        value2 = aws_instance.EC2.id
        value3 = aws_instance.EC3.id
    }
}


# output "instance_id" {
#   value = aws_instance.test.*.id
# }