# Helm Chart for Java Service

![Version: 1.1.1](https://img.shields.io/badge/Version-1.1.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 7.15.0](https://img.shields.io/badge/AppVersion-7.15.0-informational?style=flat-square)

Kibana is a free and open user interface that lets you visualize your Elasticsearch data and navigate the Elastic Stack.

### Installing the Chart

To install the chart with the release name `kibana`:

```shell
$ helm repo add romanow https://romanow.github.io/helm-charts/
$ helm repo update
$ helm install kibana romanow/kibana
```

### Uninstalling the Chart

To uninstall the `kibana` installation:

```shell
helm uninstall kibana
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
  "repository": "docker.elastic.co/kibana/kibana",
  "tag": "7.15.0"
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
"kibana"
</pre>
</td>
			<td>Ingress name</td>
		</tr>
		<tr>
			<td>port</td>
			<td>int</td>
			<td><pre lang="json">
5601
</pre>
</td>
			<td>Kibana port</td>
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

* <https://github.com/Romanow/helm-charts/tree/master/charts/kibana>
* <https://www.elastic.co/kibana/>

### Maintainer

| Name | Email | Url |
| ---- | ------ | --- |
| Romanov Alexey | <romanowalex@mail.ru> | <https://romanow.github.io> |