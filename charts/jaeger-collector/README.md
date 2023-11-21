# Helm Chart jaeger-collector

![Version: 1.5.0](https://img.shields.io/badge/Version-1.5.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.41.0](https://img.shields.io/badge/AppVersion-1.41.0-informational?style=flat-square)

Jaeger is a distributed tracing system released as open source project. It is used for monitoring and troubleshooting microservices-based distributed systems.

### Installing the Chart

To install the chart with the release name `jaeger-collector`:

```shell
$ helm repo add romanow https://romanow.github.io/helm-charts/
$ helm repo update
$ helm install jaeger-collector romanow/jaeger-collector
```

### Uninstalling the Chart

To uninstall the `jaeger-collector` installation:

```shell
helm uninstall jaeger-collector
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
			<td>elasticsearch.password</td>
			<td>string</td>
			<td><pre lang="json">
"qwerty"
</pre>
</td>
			<td>Elastic password (optional)</td>
		</tr>
		<tr>
			<td>elasticsearch.url</td>
			<td>string</td>
			<td><pre lang="json">
"http://elasticsearch:9200"
</pre>
</td>
			<td>Elastic address</td>
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
  "repository": "jaegertracing/jaeger-collector",
  "tag": "1.41.0"
}
</pre>
</td>
			<td>Image name and version</td>
		</tr>
		<tr>
			<td>ports</td>
			<td>object</td>
			<td><pre lang="json">
{
  "admin": 14269,
  "grpc": 14250,
  "http": 14268
}
</pre>
</td>
			<td>Jaeger collector ports</td>
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

* <https://www.jaegertracing.io/docs/latest/>
* <https://hub.docker.com/r/jaegertracing/jaeger-collector>

### Maintainer

| Name | Email | Url |
| ---- | ------ | --- |
| Romanov Alexey | <romanowalex@mail.ru> | <https://romanow.github.io> |
