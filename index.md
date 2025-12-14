---
layout: default
title: Home
---

## Recent Posts

<ul>
  {%- for post in site.posts limit:10 -%}
  <li>
    <h3>
      <a href="{{ post.url | relative_url }}">
        {{ post.title }}
      </a>
    </h3>
    <p class="post-meta">
      <time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%Y-%m-%d" }}</time>
    </p>
    <p>{{ post.excerpt | strip_html | truncatewords: 30 }}</p>
  </li>
  {%- endfor -%}
</ul>

<p>See the <a href="/archive/">full archive</a>.</p>
