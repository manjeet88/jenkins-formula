{% set jenkins = pillar.get('jenkins', {}) -%}
{% set plugins = jenkins.get('plugins', {}) -%}
{% set installed = plugins.get('installed', []) -%}
{% set removed = plugins.get('removed', []) -%}

{% if removed -%}
remove_plugins:
  jenkins_plugins:
    - removed
    - names:
{% for name in removed %}
      - {{ name }}
{% endfor -%}
{% endif %}

{% if installed -%}
install_plugins:
  jenkins_plugins:
    - installed
    - names:
{% for name in installed %}
      - {{ name }}
{% endfor -%}
{% endif %}

update_plugins:
  jenkins_plugins:
    - updated

restart:
  jenkins_running:
    - restart
