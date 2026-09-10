# AWS Cloud Architecture Deep Dive — ZODIAK TV

## 1. Storage Architecture (Amazon S3)
The S3 storage topology uses deliberate prefix partitioning:
```
s3://nwhite-zodiak-tv-malawi-channel-branding-production/
├── 01_pre_production/
├── 02_raw_footage/
├── 03_proxies/
├── 04_project_files/
├── 05_sound_stems/
├── 06_color_renders/
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
* **Amazon CloudWatch**: Monitors S3 bucket size, Lambda duration, and ingest transfer speed.
* **AWS CloudTrail**: Records every GetObject and PutObject call for intellectual property traceability.
