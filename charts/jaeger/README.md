# Helm Chart for jaeger

![Version: 1.6.2](https://img.shields.io/badge/Version-1.6.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.57.0](https://img.shields.io/badge/AppVersion-1.57.0-informational?style=flat-square)

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
  "repository": "jaegertracing/all-in-one",
  "tag": "1.57.0"
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
			<td>ports</td>
			<td>object</td>
			<td><pre lang="json">
{
  "admin": 16686,
  "otlp": 4318,
  "zipkin": 9411
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
			<td>storage.elasticsearch.password</td>
			<td>string</td>
			<td><pre lang="json">
"qwerty"
</pre>
</td>
			<td>Elastic password (optional)</td>
		</tr>
		<tr>
			<td>storage.elasticsearch.url</td>
			<td>string</td>
			<td><pre lang="json">
"http://elasticsearch:9200"
</pre>
</td>
			<td>Elastic address</td>
		</tr>
		<tr>
			<td>storage.elasticsearch.username</td>
			<td>string</td>
			<td><pre lang="json">
"logging"
</pre>
</td>
			<td>Elastic username (optional)</td>
		</tr>
		<tr>
			<td>storage.type</td>
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
