<!DOCTYPE html>
<html>
<head>
	<script src="https://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto">
	<style type="text/css">
		body {
			margin: 0;
			overflow: hidden;
		}

		.info {
			position: absolute;
			top: 0;
			
			font-family: 'Roboto';
			background: white;
			padding: 15px;
			border-radius: 2px;
			color: #9492e1;
			box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px;
			border: 1px solid #DDD;
			text-align: center;
			margin-top: 10px;
			cursor: pointer;
			resize: none;
		}

		.tilbaka {
			position: absolute;
			top: 40px;
			left: 9px;
			font-family: 'Roboto';
			font-size: 12px;
			background: white;
			padding: 5px;
			border-radius: 2px;
			color: #9492e1;
			width: 106px;
			box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px;
			border: 1px solid #DDD;
			text-align: center;
		}

		.tilbaka a{
			color: color: #9492e1;
			text-decoration: none;
			text-decoration-color: rgb(58, 132, 223);
		}

		.tilbaka a:hover {
			text-decoration: underline;
		}

		.verd {
			color: red;
		}

		.split {
			color: white;
		}
	</style>
	<title>Bensínstöð</title>
</head>
<body>
	<%
		from bottle import *
		if bensin > len(gogn['results']) or bensin < 0:
			abort(404)
		else:
			upplysingar = gogn['results'][bensin]
	%>
	<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d1035.4881217257396!2d{{upplysingar['geo']['lon']}}!3d{{upplysingar['geo']['lat']}}!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sis!2sis!4v1538662353908" width="100%" frameborder="0" style="border:0;width: 100vw;height:100vh;" allowfullscreen></iframe>
	<div class="tilbaka">
		<a href="/{{upplysingar['company'].lower()}}">Fara til baka</a>
	</div>
	<div class="info" draggable="true">
		
		<h2 style="text-decoration: underline;">{{upplysingar['company']}} {{upplysingar['name']}}</h2>

		<h3>Verð á bensíni</h3>
		<p>Bensín 95: <span class="verd">{{upplysingar['bensin95']}}</span>kr lítrinn</p>
		<p>Dísel: <span class="verd">{{upplysingar['diesel']}}</span>kr lítrinn</p>
		<br>
		% if upplysingar.get('bensin95_discount') != None or upplysingar.get('diesel_discount') != None:
		<hr class="split">
		<h3>Verð með afslætti</h3>
		% if upplysingar.get('bensin95_discount') != None:
		<p>Bensín 95: <span class="verd">{{upplysingar['bensin95_discount']}}</span>kr lítrinn</p>
		%end
		% if upplysingar.get('diesel_discount') != None:
		<p>Dísel: <span class="verd">{{upplysingar['diesel_discount']}}</span>kr lítrinn</p>
		%end
		%end

		
	</div>
	%end
	<script type="text/javascript">
		$(function(){
			$('.info').draggable();
		});
	</script>
</body>
</html>