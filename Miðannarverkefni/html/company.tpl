<!DOCTYPE html>
<html>
<head>
	<title>Verð hjá {{company}}</title>
	<style type="text/css">
		body {
			background: #444;
			color: white;
			text-align: center;
			margin: auto;
			max-width: 60%;
		}

		.info {
			background: #666;
			padding: 5px;
			font-size: 1.1em;
			font-family: sans-serif;
			cursor: pointer;
			
		}

		.info:hover {
			background: #999;
		}

		a {
			color: white;
		}

		.Button {
			background: blue;
			max-width: 7em;
			margin-left: calc(50% - 3.7em);
			padding: 1px;
			border-radius: 3px;
		}
	</style>
</head>
<body>
	<%
	import tools
	from bottle import *
	fall = "bensínstöðvar"
	stadir = tools.stodvar(gogn['results'], company)
	if(str(stadir)[-1] == '1'):
		fall = "bensínstöð"
	end
	if stadir > 0:
	%>
	<h2>{{company}}</h2>
	<p>{{company}} á {{stadir}} {{fall}}</p>
	<hr>
	<%
	teljari = 0
	for x in gogn['results']:
		if x['company'].lower() == company.lower():
		%>
		<div class="info">
			<h4>Staður: {{x['name']}}</h4>
			<a href="/bensinstod/{{teljari}}">Sjá meira</a>
			<br><br>
		</div>
		<hr>
	%	end
	%	teljari += 1
	%end
	<h2><a href="/">Til baka</a></h2>
	%else:
	%abort(404)
	%end
</body>
</html>