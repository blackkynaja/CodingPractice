# Company: Dropbox
# https://app.codesignal.com/company-challenges/dropbox/RMJDiTprBf5HQY3oa

def getStorageFromPoint(point):
	storage = 0
	if point >= 100:
		storage = 3
	if point >= 200:
		storage = 8
	if point >= 300:
		storage = 15
	if point >= 500:
		storage = 25

	return storage

def campusCup(emails):
	dicts = {}
	for email in emails:
		split = email.split("@")
		domain = split[1]
		if dicts.get(domain):
			dicts[domain] += 20
		else:
			dicts[domain] = 20
	# print(dicts)
	for key, value in dicts.items():
		dicts[key] = getStorageFromPoint(value)
	# print(dicts)
	sortedValues = [x[0] for x in sorted(dicts.items(), key=lambda item: (-item[1],item[0]))]
	# print(sortedValues)
	return sortedValues