from json import loads
from time import sleep
from urllib3 import PoolManager


def conversor(valor):
    return float(valor[0:4].replace(",", '.'))

with PoolManager() as pool:
    while True:
        response = pool.request('GET', 'http://localhost:9000/data.json')
        data = loads(response.data.decode('utf-8'))
        temp_min = data['Children'][0]['Children'][1]['Children'][1]['Children'][0]['Min']
        temp_value = data['Children'][0]['Children'][1]['Children'][1]['Children'][0]['Value']
        temp_max = data['Children'][0]['Children'][1]['Children'][1]['Children'][0]['Max']
        print(conversor(temp_min))
        print(conversor(temp_value))
        print(temp_max)
        sleep(1)

    