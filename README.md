# django-app

**Problem statement**

Create an EC2 instance and install minikube cluster on it. Build the django application and deploy on minikube cluster

**Pre-requisite**
- Terraform version > 1.0 must be installed on local machine
- django 
- python3

This project has diveded in below section
1. Terraform script to provision aws infrastructure
2. Django helloworld app code
3. Kubernetes manifest files
4. Github action workflow pipeline to build and deploy

**Django application**
app directory contains the helloworld app with respective url_patterns

To test django app locally, execute below command inside app directory
```python3 manage.py runserver```

**Infrastructure**
Terraform being used to provision AWS resources such as VPC, ECR, EC2, and Iam role.

Minikube installation and django app container deployed with ec2 user data script.

**CI/CD**
Github action workflow execute terraform script, build django image & push to ECR.