      <article id="article-{{key}}" {% if muted %}class="text-muted"{% endif %}>
        <header>
          <h6 class="card-title" id="{{key}}">
            <a href="#{{key}}-link" class="reference-link">{{headers.title}}</a>
            av {{content|vcs_author:lang}}
            på <em><time>{{content|vcs_date:lang}}</time></em>
            {% if muted %}
            {% else %}
            {% if important %}
            &nbsp;
            <span class="badge bg-danger text-white">Viktigt!</span>
            {% endif %}
            {% if category_root %}{% if archive_root %}
			  &nbsp;
            <button type="submit" class="btn btn-sm btn-outline-warning" name="uri"
                    value="https://{{website}}{{path|dirname}}/{{key}}.md{{lang}}">
              Svara
            </button>
			{% endif %}{% endif %}
            {% endif %}
          </h6>
        </header>
        <small>
          <p class="card-text">{{content|removetags:"script,style"|markdown}}</p>
          <hr>
          <p>&nbsp;</p>
        </small>
      </article>
