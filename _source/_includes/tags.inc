{% for tag in post.tags %}
	{{ tag }}{% unless forloop.last %}, {% endunless %}
{% endfor %}

