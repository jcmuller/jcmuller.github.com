<link type="text/css" rel="stylesheet" href="/css/style.css" />
<link type="text/css" rel="stylesheet" href="/css/pygments.css" />
{% if page.stylesheets %}
  {% for stylesheet in page.stylesheets %}
    <link type="text/css" rel="stylesheet" href="{{ stylesheet }}">
  {% endfor %}
{% endif %}
