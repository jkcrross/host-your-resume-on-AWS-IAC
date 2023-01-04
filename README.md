
# Host your resume in AWS within 5 mins

This is a simple project for hosting your resume in AWS within few mins and make it available over internet. You will have a URL to share your html resume.

The code is available in both cloudformation and terraform in this project. You can use any one of them. The code is in its respective folders.

## Introduction

This projects contains the IAC code to host your resume into AWS cloud. The code will be provisioning a S3 bucket and hosting a static website on it. I have also included a sample html and css resume page which can be edited to build your resume.

## Folders

Folders             |Description                                                                 |
------------------- | -------------------------------------------------------------------------- |
cloudformation      | This folder contains the cloudformation code to deploy your resume to AWS  |
terraform           | This folder contains the terraform code to deploy your resume to AWS       |
resume              | This folder contains html and css files for the resume                     |


## Usage

To deploy your resume website, follow one of the below set of steps. 

### Option 1: Cloudformation

- Edit the resume/index.html file as per your details or completely replace index.html & resume.css file with your resume html files. 
- Login to AWS console and navigate to Cloudformation
- Click on `Create Stack` > `With new resources (standard)`
- In Specify template section, choose `Upload a template file` and upload the cloudformation/resume-website.yaml file & click `Next`.
- Enter a **Stack name** and **S3BucketName**.
- Leave reamaing settings as it is and submit the stack.
- Since cloudformation is yet supported to upload S3 objects, we have to manually upload the objects.
- In AWS console, navigate to S3 bucket and click on the bucket which got created as part of the stack.
- Click on the Upload button and upload the html and css files from the resume folder. Make sure to Mark "Grant public-read access" while uploading.
- The website is ready! URL should be <**BUCKET-NAME**>.s3-website-us-east-1.amazonaws.com. 
- You can also get the URL from the cloudformation stack output.



### Option 2: Terraform

- Edit the resume/index.html file as per your details or completely replace index.html & resume.css file with your resume html files.
- Configure AWS Credentials in your local system. Follow the [doc](https://docs.aws.amazon.com/sdk-for-java/v1/developer-guide/setup-credentials.html) for configuring AWS credentials.
- Switch the directory to terraform. "`cd terraform`"
- Run the command "`terraform init`" to initialize the AWS Provider.
- Run the command "`terraform plan`" and provide a unique bucket name when prompted.
- Review the plan.
- Run the command "`terraform apply -auto-approve`" and provide a unique bucket name when prompted.
- It will some time to provision the resources. Once the resources are provisioned successfully, the website should be online.
- You can browse the website by navigating to "<**BUCKET-NAME**>.s3-website-us-east-1.amazonaws.com".



## Tech Stack

**Web:** HTML, CSS

**IAC:** Terraform, Cloudformation





