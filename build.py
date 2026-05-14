import os

MODULE_DIR = "modules"
OUTPUT_DIR = "build"
OUTPUT_FILE = os.path.join(OUTPUT_DIR, "main.lua")

os.makedirs(OUTPUT_DIR, exist_ok=True)

files = [
    f for f in os.listdir(MODULE_DIR)
    if f.endswith(".lua")
]

files.sort()

final_code = ""

for file in files:
    path = os.path.join(MODULE_DIR, file)

    with open(path, "r", encoding="utf-8") as f:
        content = f.read()

    final_code += content + "\n"

with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
    f.write(final_code)

print(f"Build success: {OUTPUT_FILE}")
