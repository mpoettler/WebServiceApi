import json
from influxdb import InfluxDBClient
import json
from datetime import datetime

import influxdb

#Setup database
client = InfluxDBClient('localhost', 8086, 'admin', '12345', 'scriptingUe')
client.create_database('scriptingUe')
client.get_list_database()
client.switch_database('scriptingUe')

#Setub Payload json
#Example Payload
json_payload = []
data = {
    "measurement": "stocks",
    "tags": {
        "ticker": "TSLA"
    },
    "time": datetime.now(),
    "fields": {
        'open': 688.37,
        'close' : 667.93
    }
}

json_payload.append(data)

#Send our payload
client.write_points(json_payload)

result = client.query('select * from stocks;')

print(result)