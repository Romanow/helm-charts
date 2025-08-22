# Helm Chart for kube-state-metrics

![Version: 1.7.1](https://img.shields.io/badge/Version-1.7.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2](https://img.shields.io/badge/AppVersion-2-informational?style=flat-square)

Add-on agent to generate and expose cluster-level metrics.

### Installing the Chart

To install the chart with the release name `kube-state-metrics`:

```shell
$ helm repo add romanow https://romanow.github.io/helm-charts/
$ helm repo update
$ helm install kube-state-metrics romanow/kube-state-metrics
```

### Uninstalling the Chart

To uninstall the `kube-state-metrics` installation:

```shell
helm uninstall kube-state-metrics
```

### Configuration

<table>
	<thead>
		<th>Key</th>
		<th>Type</th>
		<th>Default</th>
		<th>Description</th>
	</thead>
	<tbody>
		<tr>
			<td>image</td>
			<td>object</td>
			<td><pre lang="json">
{
  "pullPolicy": "IfNotPresent",
  "repository": "bitnami/kube-state-metrics",
  "tag": 2
}
</pre>
</td>
			<td>Image name and version</td>
		</tr>
		<tr>
			<td>port</td>
			<td>int</td>
			<td><pre lang="json">
8080
</pre>
</td>
			<td>Metrics port</td>
		</tr>
		<tr>
			<td>resources.limits</td>
			<td>object</td>
			<td><pre lang="json">
{
  "cpu": "100m",
  "memory": "512Mi"
}
</pre>
</td>
			<td>Limited resources</td>
		</tr>
		<tr>
			<td>resources.requests</td>
			<td>object</td>
			<td><pre lang="json">
{
  "cpu": "100m",
  "memory": "512Mi"
}
</pre>
</td>
			<td>Requested resources</td>
		</tr>
		<tr>
			<td>serviceName</td>
			<td>string</td>
			<td><pre lang="">
.Release.Name
</pre>
</td>
			<td>Custom service name</td>
		</tr>
	</tbody>
</table>

### Sources

* <https://github.com/kubernetes/kube-state-metrics>
* <https://hub.docker.com/r/bitnami/kube-state-metrics>

### Maintainer

| Name | Email | Url |
| ---- | ------ | --- |
| Romanov Alexey | <romanowalex@mail.ru> | <https://romanow.github.io> |
