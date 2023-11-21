# Helm Chart for elasticsearch

![Version: 1.5.0](https://img.shields.io/badge/Version-1.5.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 7.17.8](https://img.shields.io/badge/AppVersion-7.17.8-informational?style=flat-square)

Elasticsearch is a distributed, RESTful search and analytics engine capable of addressing a growing number of use cases.

### Installing the Chart

To install the chart with the release name `elasticsearch`:

```shell
$ helm repo add romanow https://romanow.github.io/helm-charts/
$ helm repo update
$ helm install elasticsearch romanow/elasticsearch
```

### Uninstalling the Chart

To uninstall the `elasticsearch` installation:

```shell
helm uninstall elasticsearch
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
			<td>clusterName</td>
			<td>string</td>
			<td><pre lang="json">
"logs"
</pre>
</td>
			<td>Cluster name</td>
		</tr>
		<tr>
			<td>image</td>
			<td>object</td>
			<td><pre lang="json">
{
  "pullPolicy": "IfNotPresent",
  "repository": "elasticsearch",
  "tag": "7.17.8"
}
</pre>
</td>
			<td>Image name and version</td>
		</tr>
		<tr>
			<td>ports.communication</td>
			<td>int</td>
			<td><pre lang="json">
9300
</pre>
</td>
			<td>ElasticSearch internal node communication port</td>
		</tr>
		<tr>
			<td>ports.external</td>
			<td>int</td>
			<td><pre lang="json">
32200
</pre>
</td>
			<td>If define, create NodePort for external usage</td>
		</tr>
		<tr>
			<td>ports.http</td>
			<td>int</td>
			<td><pre lang="json">
9200
</pre>
</td>
			<td>ElasticSearch REST port</td>
		</tr>
		<tr>
			<td>replicas</td>
			<td>int</td>
			<td><pre lang="json">
3
</pre>
</td>
			<td>Count of replicas</td>
		</tr>
		<tr>
			<td>resources.limits</td>
			<td>object</td>
			<td><pre lang="json">
{
  "cpu": "200m",
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
  "cpu": "200m",
  "memory": "1024Mi"
}
</pre>
</td>
			<td>Requested resources</td>
		</tr>
		<tr>
			<td>security.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td>Enable security</td>
		</tr>
		<tr>
			<td>security.name</td>
			<td>string</td>
			<td><pre lang="json">
"logging"
</pre>
</td>
			<td>Default username</td>
		</tr>
		<tr>
			<td>security.password</td>
			<td>string</td>
			<td><pre lang="json">
"qwerty"
</pre>
</td>
			<td>Default password</td>
		</tr>
	</tbody>
</table>

### Sources

* <https://www.elastic.co/elasticsearch/>
* <https://hub.docker.com/_/elasticsearch>

### Maintainer

| Name | Email | Url |
| ---- | ------ | --- |
| Romanov Alexey | <romanowalex@mail.ru> | <https://romanow.github.io> |
