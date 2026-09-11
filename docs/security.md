# Security & Compliance Architecture — ZODIAK TV

## 1. Data Protection Standards
* **Envelope Encryption**: I use dedicated customer-managed keys in AWS KMS to encrypt every object individually before it touches physical storage.
* **Strict Bucket Policies**: I enforce an explicit deny on all unencrypted HTTP requests (HTTPS TLS 1.3 required).

## 2. Role-Based Access Control (RBAC)
* **Editor Role**: Read-only access to raw media; full access to proxies and scratch drives.
* **Colourist Role**: High-speed read access to raw camera masters; write access to colour master folders.
* **QC & Delivery Role**: Write access limited to final delivery folders and sign-off manifests.
