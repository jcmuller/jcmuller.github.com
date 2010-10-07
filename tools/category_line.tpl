	{% if site.categories.<tmpl_var name> %}<li><a href="/<tmpl_var name>.html"><tmpl_var name> ({{ site.categories.<tmpl_var name> | size }})</a></li>{% endif %}
