FROM debian:12

RUN apt-get update && apt-get install -y curl && apt-get clean

# تحميل سكريبت التثبيت وتشغيله أوتوماتيكياً
RUN curl -fsSL https://raw.githubusercontent.com/filebrowser/get/master/get.sh | bash

# تشغيل File Browser على بورت 8080 وبلا قاعدة بيانات معقدة
# --noauth كديروها غير باش ندخلو نيشان (تقدر تزيد الباسورد فـ الدفاع)
CMD ["filebrowser", "-a", "0.0.0.0", "-p", "8080", "-r", "/data", "--noauth"]