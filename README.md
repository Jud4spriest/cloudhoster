📘 Available languages: [🇬🇧 English](README.md) | [🇧🇷 Português](README.pt.md)

# CloudHoster 🚀

CloudHoster is an ultra-lightweight, highly optimized containerized server designed to run efficiently on AWS EC2 instances (or other cloud platforms) with extremely limited hardware resources. Built to host frontend/backend web applications with maximum efficiency, each component of CloudHoster is carefully tuned to minimize memory, CPU, and disk usage, ensuring scalability with minimal consumption.

The solution combines Docker, automation, and infrastructure best practices to deliver performance, security, and stability with a strong focus on resource optimization.

---

## 📌 Key Features

✅ Nginx + PHP-FPM Web Server configured with caching, Gzip compression, HTTP/2, and FastCGI for superior performance.

✅ Postfix (SMTP) + Dovecot (IMAP/POP3) + Roundcube (Webmail) for secure and accessible email services.

✅ Secure FTP (vsftpd) for file upload and management.

✅ Optimized WordPress, with minimal footprint, page caching, opcache, and script-based deactivation of unnecessary features.

✅ MariaDB running in a separate container for better isolation, security, and performance.

✅ Services isolated via Docker, ensuring encapsulation and operational security.


---

## 🛠️ Architecture

### 🧬 1. CloudHoster Container
The container is based on Debian 12 Slim, providing a lightweight yet robust environment. It includes:

<img src="https://github.com/user-attachments/assets/eedd5ac5-2193-4498-9c1f-6a3169ae7497" alt="cloudhoster_container" width="400"/>


**It includes**:

* Nginx + PHP-FPM finely configured to reduce worker usage, limit connections, and enable dynamic caching.
* Minimal WordPress installation with optimized plugins and cached files.
* Postfix, Dovecot, Roundcube fully integrated and configured for TLS encryption, secure authentication, and rotating logs.
* vsftpd with SSL and user isolation.
* MariaDB-client for communication with the remote/database container.

### 🏠 2. System Architecture - CloudHoster on AWS
The production architecture prioritizes security, modularity, and scalability. Below is the main flow based on the image:

<img src="https://github.com/user-attachments/assets/99ee7b10-b10e-4dfe-95f2-decd906145f8" alt="cloudhoster_architecture" width="600"/>

* EC2 Instance (Amazon Linux or Debian) with Docker and Docker Compose.
* CloudHoster Containers: one or more instances for hosting different sites.
* MariaDB Container: isolated database with automated backup.
* Nginx (reverse proxy): domain routing, static page caching, and SSL termination.
* UFW + ModSecurity + Fail2Ban: internal security layer against attacks.
* Certbot (Let's Encrypt): automatic issuance and renewal of SSL certificates.

🌐 Network Layer

* Amazon VPC + Security Groups: traffic filtering and control.
* Cloudflare: CDN, caching, flexible SSL, and DDoS protection.
* Locaweb DNS: domain pointing to Cloudflare.

---

## 📦 Technologies Used

* AWS EC2 + EBS
* Docker + Docker Compose
* Nginx + PHP-FPM
* Optimized WordPress
* MariaDB
* Postfix + Dovecot + Roundcube
* UFW, Fail2Ban, Certbot, ModSecurity

---

## 🚀 How to Use

## 📁 Project Structure

```bash
.
├── cloudhoster/              # Core hosting stack
│   ├── conf/                 # Service configurations (Nginx, PHP, etc)
│   ├── scripts/              # Init/start scripts
│   └── Dockerfile            # CloudHoster image
├── database/                 # MariaDB Dockerfile and data volume
├── scripts/                  # Core hosting stack
│   ├── docker-monitor.sh     # log and monitoring hardware resources.
│   ├── verification_db.sh    # verification script for mariadb.
├── docker-compose.yml        # Single entrypoint for full stack
├── .env                      # Centralized environment variables
├── run.sh                    # startup system script.
└── README.md
```


1️⃣ Clone the repository:

> git clone https://github.com/seu-usuario/CloudHoster.git
> cd CloudHoster

2️⃣ Configure the .env file with credentials, database names, and domains.

3️⃣ Run the run.sh script. It:

* Generates init.sql with database structure.
* Starts Docker Compose with all containers.
* Applies network and environment settings.

> Nginx performs static page caching, compression, and header control to reduce latency and bandwidth consumption.


## 💡 Future Improvements

* 🔧 Optional lightweight build without WordPress and mail services for minimal container footprint.
* 🏗️ Alternative Alpine-based image to reduce base OS size and memory usage.
* 🛠️ Diagnostic and bug-check scripts for automated health checks and log analysis.
* 🖥️ Lightweight frontend control panel to manage services and configurations.
* 🔄 Replace MariaDB with MongoDB (optional build) for NoSQL-based use cases.

---
## 🧪 Status
> ✅ Functional MVP tested with:
> - AWS EC2 1GB t2.micro
> - Docker Engine v24+
> - Debian Bookworm/Ubuntu 22.04 base
---

## 📄 License

This project is licensed under the terms described in the LICENSE.md(!LICENSE.md) file.

For commercial usage involving modified versions, please read the additional conditions in the license file.

## 👋 Author
Developed by Marcos Azevedo — built to be simple, lean and professional.
