{{ define "clusterHosts" }}
{{- $list := list -}}
{{- range $i, $e := until (.Values.replicas | int) -}}
{{- $name := printf "%s-cluster-%d.%s" $.Release.Name $i $.Release.Name -}}
{{- $list = append $list $name -}}
{{- end -}}
{{- join ", " $list -}}
{{ end }}

{{ define "clusterMasterNodes" }}
{{- $list := list -}}
{{- range $i, $e := until (.Values.replicas | int) -}}
{{- $name := printf "%s-cluster-%d" $.Release.Name $i -}}
{{- $list = append $list $name -}}
{{- end -}}
{{- join ", " $list -}}
{{ end }}