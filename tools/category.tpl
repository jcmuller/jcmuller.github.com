---
title: <tmpl_var name.upper>
layout: category
---

<ul id="archive">
	{% for post in site.categories.<tmpl_var name> %}
		{% include category.html %}
	{% endfor %}
</ul>

