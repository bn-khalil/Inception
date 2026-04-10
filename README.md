*This project has been created as part of the 42 curriculum by [bn-bn].*

## 📝 Description
The **Inception** project is a comprehensive exercise in system administration and infrastructure virtualization. The core objective is to manually build a small, secure, and persistent infrastructure using **Docker**. Unlike simple containerization, this project requires building custom images from scratch (using Debian 12) and orchestrating them via **Docker Compose**.

### 🏗️ Project Overview
This infrastructure follows a microservices architecture:
- **NGINX:** The entry point using TLS v1.2/v1.3.
- **WordPress + PHP-FPM:** The application layer.
- **MariaDB:** The relational database.
- **Bonus:** Redis (cache), vsftpd (FTP), and Adminer (DB management).

### 🧠 Design Choices & Comparisons

| Feature | Comparison | My Choice & Reason |
| :--- | :--- | :--- |
| **VM vs Docker** | VMs virtualize hardware (heavy). Docker virtualizes the kernel (light). | **Docker** for its "Infrastructure as Code" approach and efficiency. |
| **Secrets vs Env** | Env variables are visible in inspect. Secrets are stored in files. | **Secrets** were used for sensitive passwords to ensure security. |
| **Network vs Host** | Host uses local IP. Network uses an isolated bridge. | **Docker Network** for service isolation and internal DNS resolution. |
| **Volumes vs Bind** | Volumes are Docker-managed. Bind Mounts map host paths. | **Hybrid Method** to meet the `/home/bn-bn/data` requirement. |

---

## 🚀 Instructions
1. **Prerequisites:** Linux, Docker, Docker Compose, and `make`.
2. **Domain:** Add `127.0.0.1 bn-bn.42.fr` to `/etc/hosts`.
3. **Execution:** Run `make all` at the root.

---

## 📚 Resources
- [Docker Documentation](https://docs.docker.com/)
- [Understanding FTP Passive Mode](http://slacksite.com/other/ftp.html)

### 🤖 AI Usage Disclosure
AI (Gemini) acted as a technical mentor for troubleshooting **vsftpd Passive Mode** flow, explaining the **Copy-on-Write** mechanism in Docker Layers, and optimizing the **Makefile** permission logic.