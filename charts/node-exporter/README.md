# Helm Chart for node-exporter

![Version: 1.5.0](https://img.shields.io/badge/Version-1.5.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.5.0](https://img.shields.io/badge/AppVersion-1.5.0-informational?style=flat-square)

Prometheus exporter for hardware and OS metrics exposed by *NIX kernels, written in Go with pluggable metric collectors.

### Installing the Chart

To install the chart with the release name `node-exporter`:

```shell
$ helm repo add romanow https://romanow.github.io/helm-charts/
$ helm repo update
$ helm install node-exporter romanow/node-exporter
```

### Uninstalling the Chart

To uninstall the `node-exporter` installation:

```shell
helm uninstall node-exporter
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
  "repository": "prom/node-exporter",
  "tag": "v1.5.0"
}
</pre>
</td>
			<td>Image name and version</td>
		</tr>
		<tr>
			<td>port</td>
			<td>int</td>
			<td><pre lang="json">
9100
</pre>
</td>
			<td>Node Exporter port</td>
		</tr>
		<tr>
			<td>resources.limits</td>
			<td>object</td>
			<td><pre lang="json">
{
  "cpu": "200m",
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
  "cpu": "200m",
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

* <https://github.com/prometheus/node_exporter>
* <https://hub.docker.com/r/prom/node-exporter>

### Maintainer

| Name | Email | Url |
| ---- | ------ | --- |
| Romanov Alexey | <romanowalex@mail.ru> | <https://romanow.github.io> |
