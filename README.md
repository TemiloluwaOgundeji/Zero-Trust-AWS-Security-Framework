This project implements a Zero-Trust AWS Security Framework using Terraform.
The goal is to build a secure, multi-account AWS environment from the ground up with strict security controls, centralized logging, and enforced governance policies.


**Objectives:**

* Design a multi-account AWS architecture
* Enforce least-privilege access control
* Implement organization-wide security guardrails
* Enable audit logging and compliance monitoring
* Apply Zero-Trust security principles


**Architecture Overview:**
The system is built using **AWS Organizations** with separate accounts for isolation and security:

**Accounts Structure:**

* Dev Account – Development activities
* Prod Account – Production workloads
* Security Account – Logging, monitoring, auditing
* Finance Account – Billing and cost management

**Core Services Used:**

* AWS Organizations (Account governance)
* IAM (Identity and access control)
* CloudTrail (Audit logging)
* S3 (Central log storage)
* Service Control Policies (SCPs)
* MFA (Multi-Factor Authentication)


**Security Design (Zero-Trust Model):**
This project follows Zero-Trust principles, meaning:

* No implicit trust between accounts or users
* All access is explicitly granted and verified
* Temporary credentials are used instead of static keys
* Continuous monitoring and logging is enforced



**Key Features**

1. Multi-Account Setup:
* AWS Organization with multiple accounts
* Isolation of workloads by environment and function


2. IAM Role-Based Access Control:
* Roles created for:

  - Developer
  - DevOps Engineer
  - Security Team
  - Finance Team
    
* Least-privilege policies enforced
* No direct user access to resources


3. Cross-Account Access:

* Secure role assumption between accounts
* Trust relationships explicitly defined
* Controlled access using IAM policies


4. Service Control Policies (SCPs):

* Prevent dangerous actions such as:

  - Disabling CloudTrail
  - Deleting logs
  - Unauthorized resource creation
* Enforced at the organization level


5. Audit Logging & Monitoring:

* CloudTrail enabled across all accounts
* Logs centralized in an S3 bucket (Security Account)
* Ensures traceability and compliance


6. MFA Enforcement:

* Multi-Factor Authentication required for all users
* Reduces risk of unauthorized access


7. Temporary Credentials Only:

* No long-term access keys allowed
* Use of STS (Security Token Service) for session-based access


8. Cost Allocation Tags:

* Tags applied to resources for:
  - Cost tracking
  - Budget control
* Enforced using policies




**Deployment (Terraform):**

Prerequisites:

* AWS CLI configured
* Terraform installed

Steps:

1. Clone the repository:

```bash
git clone https://github.com/TemiloluwaOgundeji/Zero-Trust-AWS-Security-Framework.git
cd Zero-Trust-AWS-Security-Framework
```

2. Initialize Terraform:

```bash
terraform init
```

3. Validate configuration:

```bash
terraform validate
```

4. Plan deployment:

```bash
terraform plan
```

5. Apply infrastructure:

```bash
terraform apply
```





This project is for educational purposes as part of a cloud security learning program.
