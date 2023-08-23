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

resource "aws_sns_topic" "example_sns_topic" {
    name = "ExampleSnsTopic"
}

resource "aws_cloudwatch_metric_alarm" "example_alarm" {
    alarm_name = "ExampleAlarm"
    comparison_operator = "GreaterThanOrEqualToThreshold"
    evaluation_periods = "10" # 5 minutes with a 5 minute period
    metric_name = "CPUUtilization"
    namespace = "AWS/EC2"
    period = "300" # 5 minute period
    statistic = "Average"
    threshold = "80"
    alarm_description = "This metric checks for CPU utilization higher than 80% for 5 minutes"
    alarm_actions = [aws_sns_topic.example_sns_topic.arn]

    dimensions = {
        InstanceId = aws_instance.example_instance.id
    }

    treat_missing_data = "notBreaching"

}

output "instance_id" {
    value = aws_instance.example_instance.id
}
