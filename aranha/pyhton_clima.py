import csv
import requests
import gzip

CSV_URL="https://portal.inmet.gov.br/uploads/dadoshistoricos/2023.zip"

with requests.Session() as s:
    download = s.get(CSV_URL)
    with open('2023.zip', 'wb') as f:
        f.write(download.content)

f = gzip.open('', 'rt')
file_content=f.read()

cr = csv.reader(file_content.splitlines(), delimiter=',')
my_list = list(cr)
for row in my_list:
    print(row)