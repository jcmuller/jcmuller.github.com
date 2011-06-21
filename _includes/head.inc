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
	</script>
</head>
