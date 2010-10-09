<div class="previous_page">
	{% if paginator.previous_page %}
		<a href="/{% unless paginator.previous_page == 1 %}page{{ paginator.previous_page}}{% endunless %}">
	{% endif %}
			prev
	{% if paginator.previous_page %}
		</a>
	{% endif %}
</div>

<div class="current_page">
	page {{ paginator.page }}
</div>
			
<div class="next_page">
	{% if paginator.next_page %}
		<a href="/page{{ paginator.next_page }}">
	{% endif %}
	next
	{% if paginator.next_page %}
		</a>
	{% endif %}
</div>
