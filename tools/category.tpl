---
title: <tmpl_var name.upper>
layout: category
---

{% for post in site.categories.<tmpl_var name> %}
	<div class="content lesspadding">
		<h2 class="title"><a href="{{ post.url }}">{{ post.title }}</a></h2>
		<div class="post-{{ post.id }}">
			
			<p class="author">
				On <span class="date">{{ post.date | date: '%B %d, %Y' }}</span>
				by <span class="author">{{ post.author }}</span>
			</p>
					
			<div class="entrybody post">
				{% if post.excerpt %}
					{{ post.excerpt | textilize }}
				{% else %}
					{{ post.content | truncatewords: 50 | textilize }}
				{% endif %}
			</div>
		</div>
	</div>
{% endfor %}
