# Helm Chart for java-service

![Version: 1.3.5](https://img.shields.io/badge/Version-1.3.5-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.0](https://img.shields.io/badge/AppVersion-v1.0-informational?style=flat-square)

Helm chart for Spring Boot application with logging and tracing

### Installing the Chart

To install the chart with the release name `java-service`:

```shell
$ helm repo add romanow https://romanow.github.io/helm-charts/
$ helm repo update
$ helm install java-service romanow/java-service
```

### Uninstalling the Chart

To uninstall the `java-service` installation:

```shell
helm uninstall java-service
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
			<td>circuitBreaker.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td>Enable circuit breaker (set `CIRCUIT_BREAKER_ENABLED` env)</td>
		</tr>
		<tr>
			<td>database.host</td>
			<td>string</td>
			<td><pre lang="json">
"postgres"
</pre>
</td>
			<td>Database host (set `DATABASE_HOST` env)</td>
		</tr>
		<tr>
			<td>database.name</td>
			<td>string</td>
			<td><pre lang="json">
null
</pre>
</td>
			<td>Database name (if defined, set `DATABASE_NAME` env)</td>
		</tr>
		<tr>
			<td>database.password</td>
			<td>string</td>
			<td><pre lang="json">
"test"
</pre>
</td>
			<td>Database password (set `DATABASE_PASSWORD` env)</td>
		</tr>
		<tr>
			<td>database.port</td>
			<td>int</td>
			<td><pre lang="json">
5432
</pre>
</td>
			<td>Database port (set `DATABASE_PORT` env)</td>
		</tr>
		<tr>
			<td>database.username</td>
			<td>string</td>
			<td><pre lang="json">
"program"
</pre>
</td>
			<td>Database user (set `DATABASE_USER` env)</td>
		</tr>
		<tr>
			<td>environments</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td>Additional env variables</td>
		</tr>
		<tr>
			<td>filebeat.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td>Enable send logs to ELK</td>
		</tr>
		<tr>
			<td>filebeat.image</td>
			<td>object</td>
			<td><pre lang="json">
{
  "pullPolicy": "IfNotPresent",
  "repository": "elastic/filebeat",
  "tag": "7.17.8"
}
</pre>
</td>
			<td>Filebeat agent image</td>
		</tr>
		<tr>
			<td>filebeat.logstash</td>
			<td>object</td>
			<td><pre lang="json">
{
  "host": "logstash",
  "port": 5044
}
</pre>
</td>
			<td>Logstash address</td>
		</tr>
		<tr>
			<td>filebeat.resources.limits</td>
			<td>object</td>
			<td><pre lang="json">
{
  "cpu": "50m",
  "memory": "128Mi"
}
</pre>
</td>
			<td>Limited resources</td>
		</tr>
		<tr>
			<td>filebeat.resources.requests</td>
			<td>object</td>
			<td><pre lang="json">
{
  "cpu": "50m",
  "memory": "128Mi"
}
</pre>
</td>
			<td>Requested resources</td>
		</tr>
		<tr>
			<td>image</td>
			<td>object</td>
			<td><pre lang="json">
{
  "pullPolicy": "IfNotPresent",
  "repository": null,
  "tag": null
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
false
</pre>
</td>
			<td>Enable ingress</td>
		</tr>
		<tr>
			<td>ingress.name</td>
			<td>string</td>
			<td><pre lang="">
.Release.Name
</pre>
</td>
			<td>Ingress name</td>
		</tr>
		<tr>
			<td>jaeger.application.host</td>
			<td>string</td>
			<td><pre lang="json">
"localhost"
</pre>
</td>
			<td>Jaeger agent host for application (set `JAEGER_HOST` env)</td>
		</tr>
		<tr>
			<td>jaeger.application.port</td>
			<td>int</td>
			<td><pre lang="json">
6831
</pre>
</td>
			<td>Jaeger agent port for application (set `JAEGER_PORT` env)</td>
		</tr>
		<tr>
			<td>jaeger.collector</td>
			<td>object</td>
			<td><pre lang="json">
{
  "host": "jaeger-collector",
  "port": 14250
}
</pre>
</td>
			<td>Jaeger collector address</td>
		</tr>
		<tr>
			<td>jaeger.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td>Enable jaeger distributed tracing</td>
		</tr>
		<tr>
			<td>jaeger.image</td>
			<td>object</td>
			<td><pre lang="json">
{
  "pullPolicy": "IfNotPresent",
  "repository": "jaegertracing/jaeger-agent",
  "tag": "1.41.0"
}
</pre>
</td>
			<td>Jaeger agent image</td>
		</tr>
		<tr>
			<td>jaeger.ports</td>
			<td>object</td>
			<td><pre lang="json">
{
  "admin": 14271,
  "binaryThrift": 6832,
  "compactThrift": 6831
}
</pre>
</td>
			<td>Jaeger agent ports</td>
		</tr>
		<tr>
			<td>jaeger.resources.limits</td>
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
			<td>jaeger.resources.requests</td>
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
		<tr>
			<td>liveness.delay</td>
			<td>int</td>
			<td><pre lang="json">
60
</pre>
</td>
			<td>Liveness initial delay</td>
		</tr>
		<tr>
			<td>liveness.path</td>
			<td>string</td>
			<td><pre lang="json">
"/manage/health/readiness"
</pre>
</td>
			<td>Liveness path</td>
		</tr>
		<tr>
			<td>liveness.port</td>
			<td>int</td>
			<td><pre lang="json">
8080
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>liveness.timeout</td>
			<td>int</td>
			<td><pre lang="json">
10
</pre>
</td>
			<td>Liveness timeout between requests</td>
		</tr>
		<tr>
			<td>logFolder</td>
			<td>string</td>
			<td><pre lang="">
.Release.Name
</pre>
</td>
			<td>Log folder (if filebeat is enabled)</td>
		</tr>
		<tr>
			<td>metrics.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td>Is Prometheus metrics enabled (add annotation: `prometheus.io/scrape: true`)</td>
		</tr>
		<tr>
			<td>metrics.path</td>
			<td>string</td>
			<td><pre lang="json">
"/manage/prometheus"
</pre>
</td>
			<td>Metrics path</td>
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
8080
</pre>
</td>
			<td>Application port</td>
		</tr>
		<tr>
			<td>profile</td>
			<td>string</td>
			<td><pre lang="json">
"k8s"
</pre>
</td>
			<td>Spring Boot profile</td>
		</tr>
		<tr>
			<td>readiness.delay</td>
			<td>int</td>
			<td><pre lang="json">
60
</pre>
</td>
			<td>Readiness initial delay</td>
		</tr>
		<tr>
			<td>readiness.path</td>
			<td>string</td>
			<td><pre lang="json">
"/manage/health/readiness"
</pre>
</td>
			<td>Readiness path</td>
		</tr>
		<tr>
			<td>readiness.port</td>
			<td>int</td>
			<td><pre lang="json">
8080
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>readiness.timeout</td>
			<td>int</td>
			<td><pre lang="json">
10
</pre>
</td>
			<td>Readiness timeout between requests</td>
		</tr>
		<tr>
			<td>replicas</td>
			<td>int</td>
			<td><pre lang="json">
1
</pre>
</td>
			<td>Count of replicas</td>
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
		<tr>
			<td>secrets</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td>Additional secrets</td>
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

* <https://spring.io/projects/spring-boot>
* <https://hub.docker.com/_/amazoncorretto>

### Maintainer

| Name | Email | Url |
| ---- | ------ | --- |
| Romanov Alexey | <romanowalex@mail.ru> | <https://romanow.github.io> |
