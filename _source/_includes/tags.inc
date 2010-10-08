{% for tag in page.tags %}
	{{ tag }}{% unless forloop.last %}, {% endunless %}
{% endfor %}

{% for tag in post.tags %}
	{{ tag }}{% unless forloop.last %}, {% endunless %}
{% endfor %}

