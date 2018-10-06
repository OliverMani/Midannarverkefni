<%
import urllib, json

fyrirtaeki = []
%>

<!DOCTYPE html>
<html>
<head>
	<title>Heimsíða</title>
	<style type="text/css">
		body{
			background: #444;
			margin: 0 auto;
			max-width: 60%;
			color: white;
			text-align: center;
		}

		.company {
			width: 100%;
			margin: 10px 0;
			padding: 10px 0;
			background: #666;
			text-align: center;
			cursor: pointer;
		}

		.company:hover {
			background: #999;
		}

		a {
			color: white;
			text-decoration: none;
			font-size: 1.1em;
		}

		.best {
			background: gold;
			border: 2px solid black;
			color: black;
		}
	</style>
</head>
<body>
	<h2>Fyrirtæki sem selja bensín á Íslandi</h2>
	<%
	gogn = urllib.request.urlopen('http://apis.is/petrol')

	listi = json.loads(gogn.read())
	
	for x in listi['results']:
		if fyrirtaeki.count(x['company']) == 0:
			fyrirtaeki.append(x['company'])
		end
	end

	for x in fyrirtaeki:
	%>
	<a href="/{{x.lower()}}"><div class="company">{{x}}</div></a>
	%end
	<br>
	<div class="best">
		<h3>Besta verðið:</h3>
		<% 
		results = listi['results']
		bensin95 = 10000
		bensin95_fyritaeki = ""
		bensin95_stadur = ""
		diesel = 10000
		diesel_fyrirtaeki = ""
		diesel_stadur = ""
		for x in results:
			if x['bensin95'] < bensin95:
				bensin95 = x['bensin95']
				bensin95_fyrirtaeki = x['company']
				bensin95_stadur = x['name']
			end
			if x['diesel'] < diesel:
				diesel = x['diesel']
				diesel_fyrirtaeki = x['company']
				diesel_stadur = x['name']
			end
		end
		%>
		<p><b>{{bensin95_fyrirtaeki}} {{bensin95_stadur}}: </b><u>{{bensin95}}</u> kr á lítrann (<b>Bensín 95</b>)</p>
		<p><b>{{diesel_fyrirtaeki}} {{diesel_stadur}}: </b><u>{{diesel}}</u> kr á lítrann (<b>Dísel</b>)</p>
	</div>
	<br>
	<div class="myndir">
		<img src="/static/logos/atlasolia.png" width="100" height="100">
		<img src="/static/logos/costco.jpg" width="100" height="100">
		<img src="/static/logos/dælan.png" width="100" height="100">
		<img src="/static/logos/n1.png" width="100" height="100">
		<img src="/static/logos/ob.png" width=100 height="100">
		<img src="/static/logos/olis.png" width="100" height="100">
		<img src="/static/logos/orkan.png" width="100" height="100">
		<img src="/static/logos/orkanx.png" width="100" height="100">
	</div>
</body>
</html>