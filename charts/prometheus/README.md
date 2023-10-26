# Helm Chart for prometheus

![Version: 1.5.0](https://img.shields.io/badge/Version-1.5.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.40.0](https://img.shields.io/badge/AppVersion-2.40.0-informational?style=flat-square)

Prometheus collects and stores its metrics as time series data, i.e. metrics information is stored with the timestamp at which it was recorded, alongside optional key-value pairs called labels.

### Installing the Chart

To install the chart with the release name `prometheus`:

```shell
$ helm repo add romanow https://romanow.github.io/helm-charts/
$ helm repo update
$ helm install prometheus romanow/prometheus
```

### Uninstalling the Chart

To uninstall the `prometheus` installation:

```shell
helm uninstall prometheus
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
  "repository": "prom/prometheus",
  "tag": "v2.40.0"
}
</pre>
</td>
			<td>Image name and version</td>
		</tr>
		<tr>
			<td>ports.external</td>
			<td>string</td>
			<td><pre lang="json">
null
</pre>
</td>
			<td>If define, create NodePort for external usage</td>
		</tr>
		<tr>
			<td>ports.internal</td>
			<td>int</td>
			<td><pre lang="json">
9090
</pre>
</td>
			<td>Prometheus port</td>
		</tr>
		<tr>
			<td>resources.limits</td>
			<td>object</td>
			<td><pre lang="json">
{
  "cpu": "300m",
  "memory": "1024Mi"
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
  "cpu": "300m",
  "memory": "1024Mi"
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

* <https://github.com/Romanow/helm-charts/tree/master/charts/prometheus>
* <https://prometheus.io/>

### Maintainer

| Name | Email | Url |
| ---- | ------ | --- |
| Romanov Alexey | <romanowalex@mail.ru> | <https://romanow.github.io> |
