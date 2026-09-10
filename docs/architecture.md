# Architecture Specification — ZODIAK TV

## 1. Architectural Intent
The architectural goal for the **ZODIAK TV** media pipeline is to eliminate manual bottlenecks, secure multi-terabyte camera footage, and guarantee punctual broadcast delivery against unforgiving network transmission slots.

## 2. Infrastructure Principles
1. **Infrastructure as Code (IaC)**: Every bucket, encryption key, and access role is declaratively defined in Terraform.
2. **Zero-Trust Storage Architecture**: No public buckets; all access requires signed IAM credentials or short-lived pre-signed URLs.
3. **Event-Driven Execution**: File arrivals in Amazon S3 emit events that immediately trigger containerized or serverless workers without polling.
4. **Resilient Lifecycle Governance**: High-cost storage is aggressively phased out as productions advance from active edit into archival preservation.

## 3. Technology Stack
* **Cloud Provider**: Amazon Web Services (AWS) — Primary
* **Secondary Clouds**: Multi-cloud readiness for Azure / GCP asset replication
* **IaC Engine**: HashiCorp Terraform 1.5+
* **Core AWS Services**: Amazon S3, AWS KMS, AWS IAM, AWS Lambda, Amazon CloudWatch, AWS CloudTrail
