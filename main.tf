provider "aws" {
    region = "us-west-2"
}

resource "aws_instance" "example_instance" {
    ami = "ami-03f65b8614a860c29"
    instance_type = "t2.micro"
    tags = {
        Name = "ExampleInstance"
    }
}

resource "aws_cloudwatch_metric_alarm" "example_alarm" {
    alarm_name = "ExampleAlarm"
    comparison_operator = "GreaterThanOrEqualToThreshold"
    evaluation_periods = "1"
    metric_name = "CPUUtilization"
    namespace = "AWS/EC2"
    period = "300"
    statistic = "Average"
    threshold = "70"
    alarm_description = "This metric checks for CPU utilization higher than 70%"
    alarm_actions = [aws_instance.example_instance.id]

    dimensions = {
        InstanceId = aws_instance.example_instance.id
    }

    treat_missing_data = "notBreaching"

}

output "instance_id" {
    value = aws_instance.example_instance.id
}
