# ZODIAK TV — Production Engineering & Workflow Architecture
## Channel Branding · Malawi National Terrestrial & Satellite · Channel Branding · Client: Zodiak Broadcasting Station

![ZODIAK TV Banner](assets/zodiak-logo.webp)

[![Practice: N.White Systems](https://img.shields.io/badge/Practice-N.White%20Systems-0A1128?style=flat-square&logo=nextdotjs&logoColor=D4AF37)](https://nwhite.systems)
[![Primary Cloud: AWS](https://img.shields.io/badge/Cloud-Amazon%20Web%20Services-232F3E?style=flat-square&logo=amazonwebservices&logoColor=FF9900)](https://aws.amazon.com)
[![IaC: Terraform](https://img.shields.io/badge/IaC-Terraform-844FBA?style=flat-square&logo=terraform&logoColor=white)](terraform/)
[![Status: Verified Delivery](https://img.shields.io/badge/Delivery-Broadcast%20Verified-10B981?style=flat-square)]()
[![Portfolio Review](https://img.shields.io/badge/Live%20Portfolio-nwhite.systems-D4AF37?style=flat-square)](https://nwhite.systems/my-portfolio/multimedia)

---

## Executive Summary

This repository presents the **production technology, systems thinking, and workflow architecture** behind **ZODIAK TV**, broadcast across **Channel Branding · Malawi National Terrestrial & Satellite**.

At **N.White Systems**, digital media is engineered with the same structural discipline as enterprise software and cloud infrastructure:
```
Architecture → Infrastructure → Engineering → Automation → Security → Workflow Design → QC → Delivery
```

> *"I architect the systems that make digital work."*  
> — **Whitemore Ngwira**, Principal Technology Architect & AI Systems Engineer

---

## 🎯 Verified Project Record (Result → Challenge → Contribution → Delivery)

* **RESULT**: Delivered a contemporary, authoritative on-air visual identity aligned with international broadcast benchmarks for Malawi's leading broadcaster.
* **CHALLENGE**: Creating a durable, high-impact design system that maintains transmission clarity across both digital satellite and terrestrial broadcast transmitters.
* **CONTRIBUTION**: Engineered on-air identity, station IDs, news opener suites, and daily commercial breakdown graphics packages.
* **DELIVERY**: Complete transmission graphic suite with technical runbooks for master control room (MCR) operators.

---

## ⚖️ Professional Integrity & Scope Boundary

In strict accordance with the N.White Systems transparency charter:

1. **Actual Project Experience**:
   - The creative decisions, digital intermediate (DI) workflow, colour correction, final colour grading, online finishing, technical Quality Control (QC), and transmission delivery were genuinely executed for this production.
2. **Architectural Reconstruction / Reference Architecture**:
   - The cloud infrastructure, event-driven automations, and Infrastructure as Code configurations detailed in `terraform/` and `docs/` represent an **architectural demonstration** showing how this exact production pipeline is engineered as an enterprise cloud system on AWS.
   - We distinguish between verified production history and cloud reference architectures without fabricating historical AWS resource claims.

---

## 🏗️ Cloud & Pipeline Architecture Diagrams

### 1. AWS Cloud Infrastructure Architecture
![AWS Cloud Architecture](diagrams/architecture.svg)
*Figure 1: AWS media vault, KMS envelope encryption, Lambda event-driven transcoding, and role-based IAM access control.*  
*(Editable source file: [`diagrams/architecture.excalidraw`](diagrams/architecture.excalidraw))*

### 2. End-to-End Production Pipeline Model
![Production Pipeline Model](diagrams/workflow.svg)
*Figure 2: Complete media journey from capture and camera media through cloud ingest, colour finishing, technical QC, and Glacier archive.*  
*(Editable source file: [`diagrams/workflow.excalidraw`](diagrams/workflow.excalidraw))*

---

## ⚙️ The 10-Stage Engineered Production Pipeline

| Stage | Name | Operating Scope & Systems Implementation |
| :--- | :--- | :--- |
| **01** | **CREATE / PRE-PROD** | Brief analysis, technical delivery specifications, camera format standards, and pipeline planning. |
| **02** | **CAPTURE** | Principal photography, camera media handling, multi-channel sound acquisition, checksum verification on set. |
| **03** | **STORE / INGEST** | Cloud media vault upload to Amazon S3 with server-side encryption via AWS KMS customer-managed keys. |
| **04** | **PROCESS** | Event-driven proxy generation (Lambda + FFmpeg), audio normalisation, and metadata tagging. |
| **05** | **INTEGRATE** | Seamless editorial conjoin: offline edit suites link to S3-backed proxies via authenticated endpoints. |
| **06** | **AUTOMATE** | Terraform declarative provisioning, automated transcode triggers, and ingest pipeline monitoring. |
| **07** | **INTELLIGENCE** | AI-assisted speech-to-text transcription, automated scene indexing, and initial QC flagging. |
| **08** | **CONTROL** | IAM role-based access control, CloudTrail audit trails, and strict EBU R128 loudness / gamut compliance gates. |
| **09** | **DELIVER** | Broadcast-specification mastering, clean audio stems, metadata packaging, and transmission sign-off. |
| **10** | **IMPROVE / ARCHIVE** | Automated S3 lifecycle transition from S3 Standard → Infrequent Access → S3 Glacier Deep Archive. |

---

## 🔒 Cloud Security & Governance Architecture

* **Encryption at Rest**: All media assets, project files, and cache archives are encrypted with dedicated AWS KMS customer-managed keys with automatic key rotation.
* **Encryption in Transit**: TLS 1.3 enforced across all S3 transfer endpoints and rclone mount daemon connections.
* **Identity & Access Management (IAM)**:
  * Strict separation of duties: Dedicated IAM roles for *Producer*, *Lead Editor*, *Colorist*, *QC Engineer*, and *Automated Pipeline*.
  * Least-privilege access policies prevent accidental deletion of raw camera media.
* **Auditability**: AWS CloudTrail captures every API invocation, object retrieval, and configuration change.

---

## 🤖 AI & Intelligent Automation Points

* **Automated Proxy Generation**: Event-driven AWS Lambda execution triggers within 500ms of raw camera footage landing in S3, outputting lightweight 1080p editing proxies.
* **AI Transcription & Metadata Extraction**: Audio tracks are parsed for speech-to-text timestamps, accelerating editor search and dialogue conform.
* **Automated QC Pre-flight**: Audio loudness scans verify -23 LUFS integrated target before human mastering sign-off.

---

## 📁 Repository Structure

```
├── README.md                          ← You are here
├── assets/
│   └── zodiak-logo.webp                 ← Production visual master
├── diagrams/
│   ├── architecture.svg               ← Rendered cloud architecture diagram
│   ├── architecture.excalidraw         ← Editable Excalidraw architecture source
│   ├── workflow.svg                   ← Rendered production pipeline diagram
│   └── workflow.excalidraw            ← Editable Excalidraw workflow source
├── docs/
│   ├── architecture.md                ← Detailed architectural design documentation
│   ├── workflow.md                    ← Step-by-step production workflow manual
│   ├── cloud-architecture.md          ← AWS service mapping & technical specifications
│   ├── automation.md                  ← Event-driven pipeline & AI automation guide
│   ├── security.md                    ← IAM, KMS encryption, and audit governance
│   └── delivery.md                    ← Broadcast standards & technical QC parameters
└── terraform/
    ├── main.tf                        ← Terraform AWS infrastructure resources
    ├── variables.tf                   ← Environment and configuration inputs
    └── outputs.tf                     ← S3, KMS, and IAM output parameters
```

---

## 🌐 Connecting Practice & Review

* **Live Multimedia Portfolio**: [https://nwhite.systems/my-portfolio/multimedia](https://nwhite.systems/my-portfolio/multimedia)
* **About the Architect**: [https://nwhite.systems/about-me](https://nwhite.systems/about-me)
* **GitHub Portfolio Overview**: [https://github.com/whitemorengwira/nwhitesystems](https://github.com/whitemorengwira/nwhitesystems)
* **Direct Consultation**: [hello@nwhite.systems](mailto:hello@nwhite.systems)

---

*© 2026 N.White Systems. Built with precision, systems thinking, and uncompromising delivery standards.*
