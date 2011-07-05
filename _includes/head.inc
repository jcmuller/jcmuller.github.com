<head>
	<title>{{ page.pagetitle }}{{ page.title }}</title>
	<link rel="stylesheet" href="/css/style.css" />
	<link rel="stylesheet" href="/css/pygments.css" />
	{% if page.tags or page.categories %}<meta name="keywords" content="{% if page.categories %}{% for category in page.categories %}{{ category }}{% unless forloop.last %}, {% endunless %}{% endfor %}{% if page.tags %}, {% endif %}{% endif %}{% for tag in page.tags %}{{ tag }}{% unless forloop.last %}, {% endunless %}{% endfor %}" />{% endif %}
	{% if page.excerpt %}<meta name="description" content="{{ page.excerpt }}" />{% endif %}
	<script type="text/javascript">
		var _gaq = _gaq || [];
		_gaq.push(['_setAccount', 'UA-24100064-1']);
		_gaq.push(['_trackPageview']);
		(function() {
			var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
		})();

		/* Chatter analytics javascript */
		var CA_KEY = 'c6337503ff2e767a9b1e1a61672dd3edc9e4121e98b95e05914313872afab5db';

		(function() {
			setTimeout(function(){
			  var s = document.createElement('script');
			  var f = document.getElementsByTagName('script')[0];
			  s.type = 'text/javascript';
			  s.async = true;
			  s.src = '//chatteranalytics.com/assets/ca.js';
			  f.parentNode.insertBefore(s, f);
			}, 1);
		})();
	</script>
</head>
