def byrjarMed(leita, strengur):
	return strengur[:len(leita)] == leita

def endarMed(leita, strengur):
	return strengur[len(leita):] == leita

def stodvar(listi, company):
	tala = 0
	for x in listi:
		if x['company'].lower() == company.lower():
			tala += 1
	return tala