# 👨‍💻 Developer Documentation

## ⚙ Setup from Scratch
1. **Prerequisites:** Ensure Docker and Docker Compose are installed on your Debian/Ubuntu machine.
2. **Configuration:** Copy `.env.example` to `.env` and fill in the secrets in the `srcs/secrets/` directory.
3. **Folders:** The Makefile will automatically create `/home/bn-bn/data/db` and `/home/bn-bn/data/wordpress`.

## 🏗 Build and Launch
The project is orchestrated via the **Makefile**:
- `make build`: Builds images and starts containers.
- `make logs`: Follows logs for debugging.
- `make clean`: Removes containers and networks.

## 📦 Container & Volume Management
- Use `docker exec -it [container_name] bash` for internal checks.
- Use `docker volume inspect [volume_name]` to verify the mount points.

## 💾 Data Persistence
Data is stored on the host machine at `/home/bn-bn/data/`.
- **DB Persistence:** Mapped to `/var/lib/mysql`.
- **WordPress Persistence:** Mapped to `/var/www/wordpress`.
The **Bind Mount** ensures that even if containers are purged (`make fclean`), the physical data can be recovered if the folders are backed up.