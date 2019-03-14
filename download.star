load("http.star", "http")
load("encoding/csv.star", "csv")

def download(ctx):
  res = http.get("https://data.cityofnewyork.us/api/views/8wbx-tsch/rows.csv?accessType=DOWNLOAD")
  return res.body()

def transform(ds,ctx):
  body = csv.read_all(ctx.download, skip=1)
  st = stats(body)
  ds.set_body(st)

# 0 Active,
# 1 Vehicle License Number,
# 2 Name,
# 3 License Type,
# 4 Expiration Date,
# 5 Permit License Number,
# 6 DMV License Plate Number,
# 7 Vehicle VIN Number,
# 8 Wheelchair Accessible,
# 9 Certification Date,
# 10 Hack Up Date,
# 11 Vehicle Year,
# 12 Base Number,
# 13 Base Name,
# 14 Base Type,
# 15 VEH,
# 16 Base Telephone Number,
# 17 Website,
# 18 Base Address,
# 19 Reason,
# 20 Order Date,
# 21 Last Date Updated,
# 22 Last Time Updated

def stats(data):
  stats = {
    'total': len(data),
    'vehicle_year' : {},
    'base_vehicle' : {},
    'base_type' : {},
    'hybrids' : {}
  }

  for row in data:
    if row[11]:
      stats['vehicle_year'].setdefault(row[11], 0)
      stats['vehicle_year'][row[11]] += 1
    else:
      stats['vehicle_year'].setdefault('unknown', 0)
      stats['vehicle_year']['unknown'] += 1
    if row[13]:
      stats['base_vehicle'].setdefault(row[13], 0)
      stats['base_vehicle'][row[13]] += 1
    else:
      stats['base_vehicle'].setdefault('unknown', 0)
      stats['base_vehicle']['unknown'] += 1
    if row[14]:
      stats['base_type'].setdefault(row[14], 0)
      stats['base_type'][row[14]] += 1
    else:
      stats['base_type'].setdefault('unknown', 0)
      stats['base_type']['unknown'] += 1

    if row[15]:
      stats['hybrids'].setdefault(row[15], 0)
      stats['hybrids'][row[15]] += 1
    else:
      stats['hybrids'].setdefault('unknown', 0)
      stats['hybrids']['unknown'] += 1

  return stats
