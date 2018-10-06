from bottle import *
from sys import argv

import json, urllib.request

port = 8080

if len(argv) > 1:
	port = int(argv[1])

@route('/')
def index():
	return template('html/index.tpl')

@route('/<company>')
def fyrirtaeki(company):
	gogn = urllib.request.urlopen('http://apis.is/petrol')
	listi = json.loads(gogn.read())
	return template('html/company.tpl', company=company,gogn=listi)
@route('/static/<path:path>')
def static(path):
	return static_file(path, root='static/')

@route("/bensinstod/<bensin:int>")
def bensinstod(bensin):
	gogn = urllib.request.urlopen('http://apis.is/petrol')
	listi = json.loads(gogn.read())
	return template('html/info.tpl', bensin=bensin, gogn=listi);

@error(404)
def error(err):
	return """
<html>
<head>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans">
	<title>Bensínstöð ekki til!</title>
	<style type="text/css">
		body {
			background: #444;
			color: white;
			text-align: center;
			margin: auto;
			max-width: 60%;
			background: linear-gradient( rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5) ), url('/static/background/bensinstod.jpg');
			background-size: cover;
			
		}

		a {
			color: white;
		}

		h1 {
			font-family: 'Open Sans';
		}

		.content {
			margin-top: 40vh;
		}
	</style>
	<meta charset="utf-8">
</head>
<body>
	<div class="content">
		<h1>Þessi bensínstöð er ekki til.</h1>
		<a href="/">Smelltu hér til að finna bensínstöðvar.</a>
	</div>
</body>
</html>
	"""

run(host='0.0.0.0', port=port, debug=True, reloader=True)