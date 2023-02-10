# Helm Chart for influxdb

![Version: 1.3.0](https://img.shields.io/badge/Version-1.3.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.8.4](https://img.shields.io/badge/AppVersion-1.8.4-informational?style=flat-square)

The Time Series Data Platform where developers build IoT, analytics, and cloud applications.

### Installing the Chart

To install the chart with the release name `influxdb`:

```shell
$ helm repo add romanow https://romanow.github.io/helm-charts/
$ helm repo update
$ helm install influxdb romanow/influxdb
```

### Uninstalling the Chart

To uninstall the `influxdb` installation:

```shell
helm uninstall influxdb
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
			<td>database</td>
			<td>string</td>
			<td><pre lang="json">
"k6"
</pre>
</td>
			<td>Database name</td>
		</tr>
		<tr>
			<td>image</td>
			<td>object</td>
			<td><pre lang="json">
{
  "pullPolicy": "IfNotPresent",
  "repository": "influxdb",
  "tag": "1.8.4"
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
8086
</pre>
</td>
			<td>InfluxDB port</td>
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

* <https://www.influxdata.com/>
* <https://hub.docker.com/_/influxdb>

### Maintainer

| Name | Email | Url |
| ---- | ------ | --- |
| Romanov Alexey | <romanowalex@mail.ru> | <https://romanow.github.io> |
