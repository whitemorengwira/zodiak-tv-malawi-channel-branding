# AWS Cloud Architecture Deep Dive — ZODIAK TV

## 1. My S3 Storage Architecture
I structure S3 storage topology using deliberate prefix partitioning:
```
s3://nwhite-zodiak-tv-malawi-channel-branding-production/
├── 01_pre_production/
├── 02_raw_footage/
├── 03_proxies/
├── 04_project_files/
├── 05_sound_stems/
├── 06_colour_renders/
├── 07_qc_reports/
├── 08_masters/
└── 09_marketing_promos/
```

## 2. Serverless Transcoding Pipeline
```
Raw Ingest (S3) ──> Event Notification ──> AWS Lambda (FFmpeg Layer) ──> Proxy Upload (S3)
                                                                 └──> Team Alert (SNS)
```

## 3. Observability & Auditing
* **Amazon CloudWatch**: I monitor S3 bucket growth, Lambda execution duration, and ingest transfer speed.
* **AWS CloudTrail**: I record every GetObject and PutObject call for intellectual property traceability.
