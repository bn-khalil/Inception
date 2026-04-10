# 👤 User Documentation

## 🛠 Provided Services
- **Website:** WordPress blog.
- **Admin Panel:** WordPress Dashboard and Adminer.
- **FTP Access:** Secure file management via vsftpd.
- **Database:** MariaDB backend.

## 🚦 Start & Stop the Project
- **To start:** Open a terminal and type `make`.
- **To stop:** Type `make stop`.
- **To reset everything:** Type `make fclean`.

## 🌐 Accessing the Stack
- **WordPress:** [https://bn-bn.42.fr](https://bn-bn.42.fr)
- **WordPress Admin:** `https://bn-bn.42.fr/wp-admin`
- **Adminer:** `https://bn-bn.42.fr/adminer`

## 🔑 Credentials Management
Credentials are not hardcoded. They are managed through:
- **Secrets:** Located in `srcs/secrets/`.
- **Environment:** Defined in `srcs/.env`.
*Note: The WordPress admin username is unique and does not contain the word "admin".*

## ✅ Health Checks
Run `docker ps` to ensure all containers are in the `Up` status. You can also check the site via `curl -I https://bn-bn.42.fr`.