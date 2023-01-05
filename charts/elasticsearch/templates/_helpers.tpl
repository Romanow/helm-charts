{{- define "clusterHosts" -}}
{{ $list := list }}
{{- range $i, $e := until (.Values.replicas | int) -}}
{{ $.Release.Name }}-cluster-{{ $i }}.{{ $.Release.Name }}
{{- end -}}
{{ join ", " $list }}
{{- end -}}

{{- define "clusterMasterNodes" -}}
{{ $list := list }}
{{- range $i, $e := until (.Values.replicas | int) -}}
{{ $.Release.Name }}-cluster-{{ $i }}
{{- end -}}
{{ join "," $list }}
{{- end -}}