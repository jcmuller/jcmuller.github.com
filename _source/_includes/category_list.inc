<span class="category-cloud">
	<span class="title">Categories: </span>
	<ul>
		<!category>{% if site.categories.cooking %}<li><a href="/cooking.html">cooking ({{ site.categories.cooking | size }})</a></li>{% endif %}
		<!category>{% if site.categories.cycling %}<li><a href="/cycling.html">cycling ({{ site.categories.cycling | size }})</a></li>{% endif %}
		<!category>{% if site.categories.development %}<li><a href="/development.html">development ({{ site.categories.development | size }})</a></li>{% endif %}
			<!-- insert new category here -->
	</ul>
</span>
