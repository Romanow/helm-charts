{{- define "storageConfig" -}}
{{- $storage := . -}}
{{- $storageType := $storage.type -}}
{{- $storageConfig := index $storage $storageType -}}
{{ $storageType }}:
{{- toYaml $storageConfig | nindent 14 }}
{{- end -}}
