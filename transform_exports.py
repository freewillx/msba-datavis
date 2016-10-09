import csv

data = list()
with open('./data/worldexports.csv', 'rU') as csv_file:
    data.append(('year', 'volume'))
    header_row = True

    csv_reader = csv.reader(csv_file, delimiter=",")
    for row in csv_reader:
        if header_row:
            header = row
            header_row = False
        else:
            for i in range(len(row)):
                if i > 0 and row[i]:
                    data.append((header[i], row[i]))

with open('./data/worldexports_transform.csv', 'wb') as trs_file:
    csv_writer = csv.writer(trs_file, delimiter=',', quoting=csv.QUOTE_MINIMAL)
    for entry in data:
        csv_writer.writerow([entry[0], entry[1]])
