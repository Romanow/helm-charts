# Helm Chart for common-job

![Version: 1.6.0](https://img.shields.io/badge/Version-1.6.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0](https://img.shields.io/badge/AppVersion-1.0-informational?style=flat-square)

Helm chart for job

### Installing the Chart

To install the chart with the release name `common-job`:

```shell
$ helm repo add romanow https://romanow.github.io/helm-charts/
$ helm repo update
$ helm install common-job romanow/common-job
```

### Uninstalling the Chart

To uninstall the `common-job` installation:

```shell
helm uninstall common-job
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
			<td>args</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td>Job startup arguments</td>
		</tr>
		<tr>
			<td>backoffLimit</td>
			<td>int</td>
			<td><pre lang="json">
5
</pre>
</td>
			<td>Backoff limit</td>
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
			<td>restartPolicy</td>
			<td>string</td>
			<td><pre lang="json">
"Never"
</pre>
</td>
			<td>Restart policy</td>
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
	</tbody>
</table>

### Sources

* <https://kubernetes.io/docs/concepts/workloads/controllers/job/>

### Maintainer

| Name | Email | Url |
| ---- | ------ | --- |
| Romanov Alexey | <romanowalex@mail.ru> | <https://romanow.github.io> |
