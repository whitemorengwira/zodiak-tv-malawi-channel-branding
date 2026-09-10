# Production Workflow Documentation — ZODIAK TV

## 1. End-to-End Operational Journey
From initial pre-production planning through final network broadcast, the ZODIAK TV workflow follows an uninterrupted 10-stage progression:

### Phase 1: Pre-Production & Technical Briefing
* Review channel delivery specifications (framerate, color space, audio channel layout).
* Agree upon camera codecs and shooting formats.

### Phase 2: Production & Camera Acquisition
* On-set media management with dual-backup checksum verification (MD5/SHA-256).

### Phase 3: Secure Ingest & Cloud Storage
* Media upload to encrypted S3 raw vault (`s3://nwhite-zodiak-tv-malawi-channel-branding-raw/`).

### Phase 4: Event-Driven Processing & Proxy Creation
* Automatic transcode into editorial-friendly proxies with burnt-in timecode (BITC).

### Phase 5: Editorial Conform & Online Finishing
* Editorial teams work in parallel with low-latency proxy streaming.

### Phase 6: Precision Colour Grading & DI
* High-bitrate master conform and DaVinci Resolve digital intermediate grading.

### Phase 7: Sound Design & Conform
* 5.1 and stereo mix balancing conforming to EBU R128 (-23 LUFS +/- 0.5 LUFS).

### Phase 8: Quality Control (QC) Gate
* Strict pass/fail inspection covering video levels, gamut errors, flash frames, and audio phase.

### Phase 9: Network Delivery & Handoff
* File mastering and packaging to DStv / platform transmission standards.

### Phase 10: Long-Term Archival
* Automated migration to Amazon S3 Glacier Deep Archive for multi-year preservation.
