<a href="{{ post.url }}">
  {{ post.date | date_to_string }}: {{ post.title }}
</a>
(<span class="tags">
 {% for tag in post.tags %}
   <a href="/tag/{{ tag }}">
    {{ tag }} ({{ site.tags[tag] | size }})
   </a>
 {% endfor %}
 </span>)
