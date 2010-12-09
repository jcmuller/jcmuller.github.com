<!DOCTYPE html>
<html>
	{% include head.inc %}

	<body>
		{% include header.inc %}

		<div class="content lesserpadding">
			On <span class="date">{{ page.date | date: '%B %d, %Y' }}</span>
			by <span class="author">{{ page.author }}</span>,
			filed under <span class="categories">{% include categories.html %}</span>;
			tags <span class="tags">{% include tags.inc %}</span>
		</div>

		<div class="content lesserpadding">
			<div class="post">
				{{ content }}
			</div>

			{% if site.related_posts.size > 0 %}
				<div class="title">Related:</div>
				{% for related_post in site.related_posts %}
					<a href="{{ related_post.url }}">{{ related_post.title }}</a>
				{% endfor %}
			{% endif %}
		</div>

		<div class="content lesserpadding">
			<div class="addthis_toolbox addthis_default_style ">
				<a class="addthis_button_facebook_like" fb:like:layout="button_count"></a>
				<a class="addthis_button_tweet"></a>
				<a class="addthis_counter addthis_pill_style"></a>
			</div>
			<script type="text/javascript">var addthis_config = {"data_track_clickback":true};</script>
			<script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#username=jcmuller"></script>
		</div>

		<div class="content lesserpadding">
			<div id="disqus">
				<div id="disqus_thread"></div>
				<script type="text/javascript" src="http://disqus.com/forums/juancmullersblog/embed.js"></script>
				<noscript><a href="http://juancmullersblog.disqus.com/?url=ref">View the discussion thread.</a></noscript>
			</div>
		</div>

		{% include footer.inc %}
	</body>
</html>
