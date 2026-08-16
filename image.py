import requests

PEXELS_API_KEY = "9UDnPbBSNI7gBhNAdelzIEZDF3ORMTnO8EcO0T3AUxI8sG5kl4zRnRI5"

urls = []
headers = {"Authorization": PEXELS_API_KEY}

# جلب 150 صورة لطبيبات سيدات
for page in range(1, 3):
    response = requests.get(
        "https://api.pexels.com/v1/search",
        headers=headers,
        params={
            "query": "female doctor portrait white coat",  # تحديد سيدات فقط
            "orientation": "portrait",
            "per_page": 80,
            "page": page,
        },
    )

    if response.status_code != 200:
        print(f"❌ Error {response.status_code}: {response.text}")
        break

    data = response.json()
    photos = data.get("photos", [])

    for photo in photos:
        urls.append(photo["src"]["large"])

# حفظ في ملف خاص بالسيدات
with open("female_doctor_urls.txt", "w", encoding="utf-8") as f:
    for url in urls[:150]:
        f.write(url + "\n")

print(f"✅ تم حفظ {len(urls[:150])} رابط لطبيبات سيدات في 'female_doctor_urls.txt'!")