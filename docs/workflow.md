# Production Workflow Documentation — ZODIAK TV

## 1. My End-to-End Operational Journey
From initial pre-production planning through final network broadcast, I structure the ZODIAK TV workflow as an uninterrupted ten-stage progression:

### Phase 1: Pre-Production & Technical Briefing
* I review channel delivery specifications (framerate, colour space, audio channel layout).
* I agree upon camera codecs and shooting formats with heads of department.

### Phase 2: Production & Camera Acquisition
* I establish on-set media management protocols with dual-backup checksum verification (MD5/SHA-256).

### Phase 3: Secure Ingest & Cloud Storage
* I upload camera media to an encrypted S3 raw media vault (`s3://nwhite-zodiak-tv-malawi-channel-branding-raw/`).

### Phase 4: Event-Driven Processing & Proxy Creation
* I deploy automated transcoding into editorial-friendly proxies with burnt-in timecode (BITC).

### Phase 5: Editorial Conform & Online Finishing
* I ensure editorial teams work in parallel with low-latency proxy streaming.

### Phase 6: Precision Colour Grading & DI
* I execute high-bitrate master conform and DaVinci Resolve digital intermediate colour grading.

### Phase 7: Sound Design & Conform
* I supervise 5.1 and stereo mix balancing conforming strictly to EBU R128 (-23 LUFS +/- 0.5 LUFS).

### Phase 8: Quality Control (QC) Gate
* I conduct a strict pass/fail inspection covering video levels, gamut errors, flash frames, and audio phase.

### Phase 9: Network Delivery & Handoff
* I master and package transmission deliverables to DStv / platform technical standards.

### Phase 10: Long-Term Archival
* I automate migration to Amazon S3 Glacier Deep Archive for secure multi-year preservation.
