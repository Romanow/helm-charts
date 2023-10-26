# Helm Chart for grafana

![Version: 1.5.0](https://img.shields.io/badge/Version-1.5.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 8.3.4](https://img.shields.io/badge/AppVersion-8.3.4-informational?style=flat-square)

Grafana allows you to query, visualize, alert on and understand your metrics no matter where they are stored.

### Installing the Chart

To install the chart with the release name `grafana`:

```shell
$ helm repo add romanow https://romanow.github.io/helm-charts/
$ helm repo update
$ helm install grafana romanow/grafana
```

### Uninstalling the Chart

To uninstall the `grafana` installation:

```shell
helm uninstall grafana
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
			<td>dashboards</td>
			<td>list</td>
			<td><pre lang="json">
[
  "k6-results",
  "spring-boot",
  "k8s-global",
  "k8s-namespaces",
  "k8s-pods"
]
</pre>
</td>
			<td>Preloaded dashboards</td>
		</tr>
		<tr>
			<td>image</td>
			<td>object</td>
			<td><pre lang="json">
{
  "pullPolicy": "IfNotPresent",
  "repository": "grafana/grafana",
  "tag": "8.3.4"
}
</pre>
</td>
			<td>Image name and version</td>
		</tr>
		<tr>
			<td>influxdbService</td>
			<td>string</td>
			<td><pre lang="json">
null
</pre>
</td>
			<td>InfluxDB service</td>
		</tr>
		<tr>
			<td>ingress.domain</td>
			<td>string</td>
			<td><pre lang="json">
"romanow-alex.ru"
</pre>
</td>
			<td>Domain</td>
		</tr>
		<tr>
			<td>ingress.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td>Enable ingress</td>
		</tr>
		<tr>
			<td>ingress.name</td>
			<td>string</td>
			<td><pre lang="json">
"grafana"
</pre>
</td>
			<td>Ingress name</td>
		</tr>
		<tr>
			<td>port</td>
			<td>int</td>
			<td><pre lang="json">
3000
</pre>
</td>
			<td>Grafana port</td>
		</tr>
		<tr>
			<td>prometheusService</td>
			<td>string</td>
			<td><pre lang="json">
"prometheus"
</pre>
</td>
			<td>Prometheus service</td>
		</tr>
		<tr>
			<td>resources.limits</td>
			<td>object</td>
			<td><pre lang="json">
{
  "cpu": "500m",
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
  "cpu": "500m",
  "memory": "1024Mi"
}
</pre>
</td>
			<td>Requested resources</td>
		</tr>
	</tbody>
</table>

### Sources

* <https://grafana.com/grafana/>
* <https://hub.docker.com/r/grafana/grafana>

### Maintainer

| Name | Email | Url |
| ---- | ------ | --- |
| Romanov Alexey | <romanowalex@mail.ru> | <https://romanow.github.io> |
