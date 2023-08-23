# EC2 Cloudwatch SNS

## Overview

This project aims to provide a practical example of setting up infrastructure monitoring and alerts using Terraform and AWS services. The system consists of an EC2 instance with CloudWatch monitoring, and it includes a Python script to simulate high CPU load. A CloudWatch Alarm is configured to trigger an SNS notification when the CPU utilization exceeds 80% for more than 5 minutes.

## Prerequisites

Before you begin, make sure you have the following:
* An AWS account and AWS CLI configured with necessary permissions
* Terraform installed on your local machine.

## Getting Started

1. Clone this repository to your local machine
   
   ```bash
   git clone https://github.com/edmundj0/ec2-cloudwatch-sns.git && cd ec2-cloudwatch-sns
   ```
### Terraform Setup
1. Modify the 'main.tf' file to customize settings such as region, instance type, and AMI ID
2. Run terraform commands to create the infrastructure
  ```hcl
  terraform init
  terraform plan
  terraform apply
  ```
### Python Script
1. Connect into the created EC2 instance using SSH. You can find information here: [Connect to EC2 Linux Instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/connect-linux-inst-ssh.html)
2. Create a Python file and paste the content of the provided `simulate-high-cpu-load.py` script
3. Run the Python script to simulate high CPU load
   
     ```
     python3 simulate_high_cpu_load.py
     ```
## Usage
After setup, you can observe the EC2 instance's CPU utilization using CloudWatch metrics. The CloudWatch Alarm will trigger an SNS notification when CPU utilization exceeds 80% for more than 5 minutes.

The project can be modified through the Terraform configuration and/or the Python script to suit your specific requirements.
