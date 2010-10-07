<!DOCTYPE html>
<html>
	{% include head.inc %}

	<body>
		{% include header.inc %}
		<p>date: {{ page.date | date_to_long_string }}</p>
		<p>author: {{ page.author }}</p>

		<div class="content">
			<div class="title">Categories:</div>
			{% include categories.html %}

			<div class="title">Permalink:</div>
			<a href="{{ page.id }}">{{ page.id }}</a>

			<div class="post">
				{{ content }}
			</div>

			<div class="title">Related:</div>
			{% for related_post in site.related_posts %}
				<a href="{{ related_post.url }}">{{ related_post.title }}</a>
			{% endfor %}
		</div>

		<div id="disqus">
			<div id="disqus_thread"></div>
			<script type="text/javascript" src="http://disqus.com/forums/juancmullersblog/embed.js"></script>
			<noscript><a href="http://juancmullersblog.disqus.com/?url=ref">View the discussion thread.</a></noscript>
		</div>


		{% include footer.inc %}
	</body>
</html>
