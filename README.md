# 🛡️ Backup Guardian

Backup Guardian is an automated cloud backup and recovery system built using Bash, Docker, Microsoft Azure, Prometheus, and Grafana.

It automates data backups, compresses them, uploads them to Azure Blob Storage, and provides monitoring for backup operations.

---

## 🚀 Features

- Automated backup creation
- Compressed `.tar.gz` archives
- Azure Blob Storage integration
- Backup logging
- Local backup retention policy
- Backup recovery and restore support
- Dockerized deployment
- Monitoring with Prometheus
- Visualization with Grafana

---

## 🏗️ Architecture
Application Data
│
▼
Backup Script (Bash)
│
▼
Compressed Archive (.tar.gz)
│
▼
Local Storage
│
▼
Azure Blob Storage
│
▼
Monitoring (Prometheus + Grafana)

---

## 🛠️ Technologies Used

- Linux (Ubuntu)
- Bash Scripting
- Docker
- Microsoft Azure
- Azure Virtual Machines
- Azure Blob Storage
- Prometheus
- Grafana
- Git & GitHub

---

## 📁 Project Structure

backup-guardian/
│
├── data/
├── backups/
├── logs/
├── monitoring/
│ └── docker-compose.yml
├── scripts/
│ └── backup.sh
├── Dockerfile
└── README.md

---

## ⚙️ How It Works

1. Reads data from the source directory
2. Creates a compressed backup archive
3. Stores backup locally
4. Uploads backup to Azure Blob Storage
5. Logs all backup operations
6. Deletes old backups based on retention policy
7. Provides monitoring dashboards

---

## 🧹 Backup Retention Policy

- Backups are retained for **90 days**
- After 90 days, they are **automatically deleted permanently**
- No alerts or notifications are triggered

---

## ♻️ Restore / Recovery

To restore a backup:

```bash
mkdir restore-test

tar -xzf backups/<backup-file>.tar.gz -C restore-test

Check restored files:

ls -R restore-test
📊 Monitoring
Prometheus collects system and backup metrics
Grafana visualizes dashboards
Runs using Docker Compose

Start monitoring:

cd monitoring
docker-compose up -d
☁️ Azure Integration
Backups are stored in Azure Blob Storage
Provides secure offsite storage
Supports disaster recovery
Ensures scalable cloud backup system
