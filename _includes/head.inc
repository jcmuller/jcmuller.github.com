<head>
  <meta name="google-site-verification" content="xo1qaSArvPxIi0g18A2m4Je-Wqu3BXErGTzuooyByqM" />
  <title>{{ page.pagetitle }}{{ page.title }}</title>
  {% include stylesheets.inc %}
  {% if page.tags or page.categories %}
    <meta name="keywords" content="{{ page.categories | join: ", " }}, {{ page.tags | join: ", " }}" />
  {% endif %}
  {% if page.excerpt %}<meta name="description" content="{{ page.excerpt }}" />{% endif %}
</head>
