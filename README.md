*Problem Statement 

Compu Global Hyper Meganet (CGHM) is looking to build a sign-up page so that potential customers can be notified when the company’s long anticipated ServiceX is released.
ServiceX’s potential / future customer base must remain confidential. CGHM have chosen to build and maintain this service themselves and use Infrastructure-as-Code practices as a way
to minimize risk through misconfiguration.

Create an Internet-facing name and email registration service.
○ As this is currently at a ‘proof-of-concept’ stage there is no expectation of accuracy or privacy: users can input and retrieve any entry.
○ However an authentication mechanism (eg. sign-up form / DB) must be implemented that later be extended or substituted with minimal impact on the overall solution

*Solution 

To use Elastic Beanstalk to create a web application that serves as a sign up page, for potential customers of CGHM storing the required data in Dynamo DB for further processing .

This solution is selected as it builds full stack setting such as ami, dynamo DB, elb, SNS and autoscaling on its own and  has full potential to be scaled as a production application without major shifts.

*Architecture Reference 

<img width="590" alt="Architecture" src="https://user-images.githubusercontent.com/59480781/198051072-1a19eb63-95d0-439c-9f78-9a947af50916.PNG">

*How to Run Code

1. Clone the git repo on local
2. Make sure you have admin access on a AWS account and the keys are present as default under ~/.aws/credentials and region under ~/.aws/config
3. Run terraform init
4. Run terraform plan
5. Run terraform apply
6. Open the url submitted as output
7. Enter ur details and submit
8. you can see these details in the dynamo DB table items

In any case the apply fails please make sure you have a role called aws-elasticbeanstalk-ec2-role with full access to SNS and DynamoDB

*Success test screenshots 

1. Sign Up page pop up
![image](https://user-images.githubusercontent.com/59480781/198052398-68c7228c-fa68-41d1-8146-c7e2dd773bd6.png)

2. Entering Creds
![image](https://user-images.githubusercontent.com/59480781/198052648-e84bda91-6f12-43f6-8a7d-1d356345beb3.png)

3. Entry in DB
![image](https://user-images.githubusercontent.com/59480781/198052958-83daf7f8-49b3-4372-b0ec-61d992bc24a0.png)

*Production Readiness

1. Route 53 Entry for client Domain
2. SSL certs can be added
3. Separate DB can be created that is not linked to EBS. or we can retain snapshots in EBS
4. Scaling conditions can be added
5. Add relevant tags
6. Source code must be secured
7. Automate deployment via Jenkins
8. Add key pair configuration
9. Enable Managed Updates
10. We can use Blue Green approach for deployments

