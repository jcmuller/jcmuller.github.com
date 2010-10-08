<head>
	<title>{{ page.pagetitle }}{{ page.title }}</title>
	<link rel="stylesheet" href="/css/style.css" />
	<link rel="stylesheet" href="/css/pygments.css" />
	{% if page.tags or page.categories %}<meta name="keywords" content="{% for category in page.categories %}{{ category }}{% unless forloop.last %}, {% endunless %}{% endfor %}, {% for tag in page.tags %}{{ tag }}{% unless forloop.last %}, {% endunless %}{% endfor %}" />{% endif %}
	{% if page.excerpt %}<meta name="description" content="{{ page.excerpt }}" />{% endif %}
</head>

