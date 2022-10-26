Problem Statement 

Compu Global Hyper Meganet (CGHM) is looking to build a sign-up page so that potential customers can be notified when the company’s long anticipated ServiceX is released.
ServiceX’s potential / future customer base must remain confidential. CGHM have chosen to build and maintain this service themselves and use Infrastructure-as-Code practices as a way
to minimize risk through misconfiguration.

Create an Internet-facing name and email registration service.
○ As this is currently at a ‘proof-of-concept’ stage there is no expectation of accuracy or privacy: users can input and retrieve any entry.
○ However an authentication mechanism (eg. sign-up form / DB) must be implemented that later be extended or substituted with minimal impact on the overall solution

Solution 

To use Elastic Beanstalk to create a web application that serves as a sign up page, for potential customers of CGHM storing the required data in Dynamo DB for further processing .

This solution is selected as it builds full stack setting such as ami, dynamo DB, elb, SNS and autoscaling on its own and  has full potential to be scaled as a production application without major shifts.

Architecture Reference 

<img width="590" alt="Architecture" src="https://user-images.githubusercontent.com/59480781/198051072-1a19eb63-95d0-439c-9f78-9a947af50916.PNG">

How to Run Code

1. Clone the git repo on local
2. Make sure you have admin access on a AWS account
3. Run terraform init
4. Run terraform plan
5. Run terraform apply
6. Open the url submitted as output
7. Enter ur details and submit
8. you can see these details in the dynamo DB table items

In any case the apply fails please make sure you have a role called aws-elasticbeanstalk-ec2-role with full access to SNS and DynamoDB
