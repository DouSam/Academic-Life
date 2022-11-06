import os

path = "D:\Academic Life\Fatec"

def count_pastas(path):
    count = 0
    for root, dirs, files in os.walk(path):
        for file in dirs:
            count += 1
    return count

def count_arquivos(path):
    count = 0
    for root, dirs, files in os.walk(path):
        for file in files:
            count += 1
    return count

def count_files_extension(path, extension):
    count = 0
    for root, dirs, files in os.walk(path):
        for file in files:
            if file.endswith(extension):
                count += 1
    return count

