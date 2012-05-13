<a href="{{ post.url }}">
  {{ post.date | date_to_string }}: {{ post.title }}
</a>
(<span class="tags">{{ post | tags }}</span>)
