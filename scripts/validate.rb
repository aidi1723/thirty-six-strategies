#!/usr/bin/env ruby
# frozen_string_literal: true

require 'json'
require 'yaml'
require 'find'

skill_dir = File.expand_path('..', __dir__)

def abort_with(message)
  warn "Validation failed: #{message}"
  exit 1
end

def read(path)
  File.read(path)
rescue Errno::ENOENT
  abort_with("missing required file: #{path}")
end

skill_md = File.join(skill_dir, 'SKILL.md')
skill_text = read(skill_md)
abort_with('SKILL.md must start with YAML frontmatter') unless skill_text.start_with?("---\n")

frontmatter = skill_text.match(/\A---\n(.*?)\n---/m)
abort_with('SKILL.md frontmatter is not closed') unless frontmatter

metadata = YAML.safe_load(frontmatter[1])
abort_with('frontmatter name must be thirty-six-strategies') unless metadata['name'] == 'thirty-six-strategies'
abort_with('frontmatter description must be present') unless metadata['description'].is_a?(String) && !metadata['description'].strip.empty?

Find.find(skill_dir) do |path|
  next unless path.end_with?('.md')

  fence_count = read(path).scan(/^```/).length
  abort_with("unbalanced Markdown code fences in #{path}") unless fence_count.even?
end

YAML.safe_load(read(File.join(skill_dir, 'agents/openai.yaml')))

schema_md = read(File.join(skill_dir, 'references/schema.md'))
schema_json = schema_md[/```json\n(.*?)\n```/m, 1]
abort_with('references/schema.md must contain a json code block') unless schema_json

schema = JSON.parse(schema_json)
properties = schema.fetch('parameters').fetch('properties')
required = schema.fetch('parameters').fetch('required')

expected_required = %w[context_type dilemma_or_input my_resources_and_position]
missing_required = expected_required - required
abort_with("schema required fields missing: #{missing_required.join(', ')}") unless missing_required.empty?

expected_fields = expected_required + %w[opponent_profile]
missing_properties = expected_fields - properties.keys
abort_with("schema properties missing: #{missing_properties.join(', ')}") unless missing_properties.empty?

readme_text = read(File.join(skill_dir, 'README.md'))
missing_readme_fields = expected_fields.reject { |field| readme_text.include?("`#{field}`") }
abort_with("README does not document fields: #{missing_readme_fields.join(', ')}") unless missing_readme_fields.empty?

missing_skill_fields = expected_fields.reject { |field| skill_text.include?("`#{field}`") }
abort_with("SKILL.md does not document fields: #{missing_skill_fields.join(', ')}") unless missing_skill_fields.empty?

workflows_text = read(File.join(skill_dir, 'references/workflows.md'))
context_types = properties.fetch('context_type').fetch('enum')
workflow_titles = workflows_text.scan(/^## (.+)$/).flatten.map(&:downcase).join("\n")
missing_workflows = context_types.reject do |context_type|
  context_type.split('_').all? { |part| workflow_titles.include?(part) }
end
abort_with("workflows do not cover context types: #{missing_workflows.join(', ')}") unless missing_workflows.empty?

puts 'Validation passed'
