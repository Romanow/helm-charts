# Helm Chart for postgres

![Version: 1.3.3](https://img.shields.io/badge/Version-1.3.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 15](https://img.shields.io/badge/AppVersion-15-informational?style=flat-square)

PostgreSQL is a powerful, open source object-relational database system.

### Installing the Chart

To install the chart with the release name `postgres`:

```shell
$ helm repo add romanow https://romanow.github.io/helm-charts/
$ helm repo update
$ helm install postgres romanow/postgres
```

### Uninstalling the Chart

To uninstall the `postgres` installation:

```shell
helm uninstall postgres
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
			<td>config</td>
			<td>string</td>
			<td><pre lang="json">
null
</pre>
</td>
			<td>Additional config, merged with default into postgres.conf</td>
		</tr>
		<tr>
			<td>databases</td>
			<td>list</td>
			<td><pre lang="json">
[
  {
    "name": "services",
    "user": "program"
  }
]
</pre>
</td>
			<td>Created databases on startup</td>
		</tr>
		<tr>
			<td>defaultDatabase</td>
			<td>object</td>
			<td><pre lang="json">
{
  "name": "postgres",
  "password": "postgres",
  "user": "postgres"
}
</pre>
</td>
			<td>Default user and database</td>
		</tr>
		<tr>
			<td>image</td>
			<td>object</td>
			<td><pre lang="json">
{
  "pullPolicy": "IfNotPresent",
  "repository": "postgres",
  "tag": 15
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
5432
</pre>
</td>
			<td>Postgres port</td>
		</tr>
		<tr>
			<td>resources.limits</td>
			<td>object</td>
			<td><pre lang="json">
{
  "cpu": "100m",
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
  "cpu": "100m",
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
		<tr>
			<td>users</td>
			<td>list</td>
			<td><pre lang="json">
[
  {
    "name": "program",
    "password": "test"
  }
]
</pre>
</td>
			<td>Created users on startup</td>
		</tr>
	</tbody>
</table>

### Sources

* <https://www.postgresql.org/>
* <https://hub.docker.com/_/postgres>

### Maintainer

| Name | Email | Url |
| ---- | ------ | --- |
| Romanov Alexey | <romanowalex@mail.ru> | <https://romanow.github.io> |
