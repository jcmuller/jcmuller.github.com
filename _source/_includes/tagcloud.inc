<div class="title">Categories</div>
<ul>
	{% if site.categories.coding %}<li><a href="/coding.html">coding ({{ site.categories.coding | size }})</a></li>{% endif %}
	{% if site.categories.cooking %}<li><a href="/cooking.html">cooking ({{ site.categories.cooking | size }})</a></li>{% endif %}
	{% if site.categories.cycling %}<li><a href="/cycling.html">cycling ({{ site.categories.cycling | size }})</a></li>{% endif %}
	{% if site.categories.development %}<li><a href="/development.html">development ({{ site.categories.development | size }})</a></li>{% endif %}
	{% if site.categories.javascript %}<li><a href="/javascript.html">javascript ({{ site.categories.javascript | size }})</a></li>{% endif %}
	{% if site.categories.perl %}<li><a href="/perl.html">perl ({{ site.categories.perl | size }})</a></li>{% endif %}
	{% if site.categories.vim %}<li><a href="/vim.html">vim ({{ site.categories.vim | size }})</a></li>{% endif %}
	<!-- insert new category here -->
</ul>
