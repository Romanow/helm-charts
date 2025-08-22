# Helm Chart for fluent-bit

![Version: 1.7.1](https://img.shields.io/badge/Version-1.7.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 4.0-debug](https://img.shields.io/badge/AppVersion-4.0--debug-informational?style=flat-square)

Fluent Bit, lightweight logs and metrics collector and forwarder.

### Installing the Chart

To install the chart with the release name `fluent-bit`:

```shell
$ helm repo add romanow https://romanow.github.io/helm-charts/
$ helm repo update
$ helm install fluent-bit romanow/fluent-bit
```

### Uninstalling the Chart

To uninstall the `fluent-bit` installation:

```shell
helm uninstall fluent-bit
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
			<td>debug</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td>Debug output to stdout</td>
		</tr>
		<tr>
			<td>elasticsearch.host</td>
			<td>string</td>
			<td><pre lang="json">
"elasticsearch"
</pre>
</td>
			<td>Elastic host</td>
		</tr>
		<tr>
			<td>elasticsearch.index</td>
			<td>string</td>
			<td><pre lang="json">
"logs"
</pre>
</td>
			<td>Elastic index</td>
		</tr>
		<tr>
			<td>elasticsearch.password</td>
			<td>string</td>
			<td><pre lang="json">
"qwerty"
</pre>
</td>
			<td>Elastic password (optional)</td>
		</tr>
		<tr>
			<td>elasticsearch.port</td>
			<td>int</td>
			<td><pre lang="json">
9200
</pre>
</td>
			<td>Elastic port</td>
		</tr>
		<tr>
			<td>elasticsearch.username</td>
			<td>string</td>
			<td><pre lang="json">
"logging"
</pre>
</td>
			<td>Elastic username (optional)</td>
		</tr>
		<tr>
			<td>image</td>
			<td>object</td>
			<td><pre lang="json">
{
  "pullPolicy": "IfNotPresent",
  "repository": "fluent/fluent-bit",
  "tag": "4.0-debug"
}
</pre>
</td>
			<td>Image name and version</td>
		</tr>
		<tr>
			<td>port</td>
			<td>int</td>
			<td><pre lang="json">
5170
</pre>
</td>
			<td>Fluent-bit port</td>
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

* <https://fluentbit.io/>
* <https://hub.docker.com/r/fluent/fluent-bit>

### Maintainer

| Name | Email | Url |
| ---- | ------ | --- |
| Romanov Alexey | <romanowalex@mail.ru> | <https://romanow.github.io> |
