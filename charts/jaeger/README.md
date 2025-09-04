# Helm Chart for jaeger

![Version: 1.7.3](https://img.shields.io/badge/Version-1.7.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.9.0](https://img.shields.io/badge/AppVersion-2.9.0-informational?style=flat-square)

Jaeger is a distributed tracing system released as open source project. It is used for monitoring and troubleshooting microservices-based distributed systems.

### Installing the Chart

To install the chart with the release name `jaeger`:

```shell
$ helm repo add romanow https://romanow.github.io/helm-charts/
$ helm repo update
$ helm install jaeger romanow/jaeger
```

### Uninstalling the Chart

To uninstall the `jaeger` installation:

```shell
helm uninstall jaeger
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
  "repository": "jaegertracing/jaeger",
  "tag": "2.9.0"
}
</pre>
</td>
			<td>Image name and version</td>
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
"jaeger"
</pre>
</td>
			<td>Ingress name</td>
		</tr>
		<tr>
			<td>metrics.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>metrics.storage.elasticsearch.auth.basic.password</td>
			<td>string</td>
			<td><pre lang="json">
"qwerty"
</pre>
</td>
			<td>Elastic password (optional)</td>
		</tr>
		<tr>
			<td>metrics.storage.elasticsearch.auth.basic.username</td>
			<td>string</td>
			<td><pre lang="json">
"logging"
</pre>
</td>
			<td>Elastic username (optional)</td>
		</tr>
		<tr>
			<td>metrics.storage.elasticsearch.server_urls</td>
			<td>list</td>
			<td><pre lang="json">
[
  "http://elasticsearch:9200"
]
</pre>
</td>
			<td>Elastic address</td>
		</tr>
		<tr>
			<td>metrics.storage.type</td>
			<td>string</td>
			<td><pre lang="json">
"elasticsearch"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ports</td>
			<td>object</td>
			<td><pre lang="json">
{
  "http": 16686,
  "metrics": 8888,
  "telemetry": 4318
}
</pre>
</td>
			<td>Jaeger ports</td>
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
		<tr>
			<td>traces.storage.elasticsearch.auth.basic.password</td>
			<td>string</td>
			<td><pre lang="json">
"qwerty"
</pre>
</td>
			<td>Elastic password (optional)</td>
		</tr>
		<tr>
			<td>traces.storage.elasticsearch.auth.basic.username</td>
			<td>string</td>
			<td><pre lang="json">
"logging"
</pre>
</td>
			<td>Elastic username (optional)</td>
		</tr>
		<tr>
			<td>traces.storage.elasticsearch.server_urls</td>
			<td>list</td>
			<td><pre lang="json">
[
  "http://elasticsearch:9200"
]
</pre>
</td>
			<td>Elastic address</td>
		</tr>
		<tr>
			<td>traces.storage.memory.max_traces</td>
			<td>int</td>
			<td><pre lang="json">
30000
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>traces.storage.type</td>
			<td>string</td>
			<td><pre lang="json">
"elasticsearch"
</pre>
</td>
			<td></td>
		</tr>
	</tbody>
</table>

### Sources

* <https://www.jaegertracing.io/docs/latest/>
* <https://hub.docker.com/r/jaegertracing/all-in-one>

### Maintainer

| Name | Email | Url |
| ---- | ------ | --- |
| Romanov Alexey | <romanowalex@mail.ru> | <https://romanow.github.io> |
