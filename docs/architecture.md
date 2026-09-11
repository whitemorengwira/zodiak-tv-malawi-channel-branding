# Architecture Specification — ZODIAK TV

## 1. My Architectural Intent
My architectural objective for the **ZODIAK TV** media pipeline is to eliminate manual bottlenecks, secure multi-terabyte camera footage, and guarantee punctual broadcast delivery against unforgiving network transmission slots.

## 2. My Infrastructure Principles
1. **Infrastructure as Code (IaC)**: I declaratively define every bucket, encryption key, and access role in Terraform for deterministic reproducibility.
2. **Zero-Trust Storage Architecture**: I enforce no public buckets; all access requires signed IAM credentials or short-lived pre-signed URLs.
3. **Event-Driven Execution**: I design file arrivals in Amazon S3 to emit events that immediately trigger containerised or serverless workers without polling.
4. **Resilient Lifecycle Governance**: I aggressively phase out high-cost storage as productions advance from active edit into archival preservation.

## 3. Technology Stack
* **Primary Cloud Provider**: Amazon Web Services (AWS)
* **Secondary Multi-Cloud Capabilities**: Microsoft Azure / Google Cloud Platform asset replication readiness
* **IaC Engine**: HashiCorp Terraform 1.5+
* **Core AWS Services**: Amazon S3, AWS KMS, AWS IAM, AWS Lambda, Amazon CloudWatch, AWS CloudTrail
