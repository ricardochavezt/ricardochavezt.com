---
layout: page
title: The Garden
id: garden
permalink: /garden
---

# The Garden

<strong>Recently updated notes</strong>

<ul>
{% assign recent_notes = site.notes | sort: "last_modified_at_timestamp" | reverse %}
{% for note in recent_notes limit: 5 %}
    <li>
    {{ note.last_modified_at | date: "%Y-%m-%d" }} — <a class="internal-link" href="{{ site.baseurl }}{{ note.url }}">{{ note.title }}</a>
    </li>
{% endfor %}
</ul>
