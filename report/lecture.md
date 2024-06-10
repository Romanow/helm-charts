# Очумелые ручки: делаем свой Helm Chart Repository из подручных средств

### Kubernetes

Kubernetes (от др. -греч. κυβερνήτης — штурвал) — это платформа с открытым исходным кодом для управления
контейнеризованными рабочими нагрузками и сервисами.

На вход Kubernetes получает манифест с описанием желаемого состояния кластера. Получив эту информацию он пытается
привести текущее состояние к желаемому: для этого выполняется множество задач, таких как запуск или перезапуск
контейнеров, масштабирование количества реплик данного приложения, сетевая связность, политики безопасности и многое
другое.

Типовой манифест для Kubernetes выглядит так:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: simple-backend
spec:
  replicas: 1
  selector:
    matchLabels:
      app: simple-backend
  template:
    metadata:
      labels:
        app: simple-backend
    spec:
      containers:
        - name: simple-backend
          image: "romanowalex/simple-backend:v1.0"
          ports:
            - name: simple-backend
              containerPort: 8080
```

Но что делать, если нам надо задеплоить такое же приложение, но с другим image и tag? Если для каждого приложения писать
свой манифест, то в случае, если потребуется что-то в них доработать, нужно будет вносить изменения в N одинаковых
файлов.

### Что такое Helm Charts, какие задачи он решает

Helm – менеджер пакетов для Kubernetes. Helm развертывает пакетные приложения в Kubernetes и структурирует их в charts.
Charts содержат все предустановленные ресурсы приложения вместе со всеми версиями, которые помещены в один легко
управляемый пакет.

```
helm-package/
  |- .helmignore   # ingnore
  |- Chart.yaml    # meta информация о пакете
  |- values.yaml   # default значения дла шаблонов
  |- charts/       # subcharts и dependencies
  |- templates/    # шаблоны
```

Задача Helm – предоставить инструмент для шаблонизации манифестов, чтобы их можно было переиспользовать для различных
задач.

### Best Practice и правила оформления `Chart.yaml`

#### Соглашение об именовании

* Переменные в camelCase (`serviceName`, `serverPort`).
* Имена chart в dash-case (`java-service`).
* Отступы в два пробела, tabs использовать нельзя.
* Версионирование charts через [semver2](https://semver.org/).

Ссылки:

* [The Chart Best Practices Guide](https://helm.sh/docs/chart_best_practices/)

#### Общие правила

##### Использовать рекомендованные метки Kubernetes

| Название label                 | Описание |
|--------------------------------|----------|
| `app.kubernetes.io/name`       | Имя приложения (может быть `{{ .Chart.Name }}`) |
| `helm.sh/chart`                | Имя и версия chart `{{ .Chart.Name }}-{{ .Chart.Version }}` |
| `app.kubernetes.io/managed-by` | `{{ .Release.Service }}` (используется чтобы найти все ресурсы, установленные через Helm) |
| `app.kubernetes.io/instance`   | `{{ .Release.Name }}` |
| `app.kubernetes.io/version`    | Версия приложения `{{ .Chart.AppVersion }}` |
| `app.kubernetes.io/component`  | Название компонента (database, backend, etc) |
| `app.kubernetes.io/part-of`    | Имя всего приложения |

Ссылки:

* [Labels and Annotations](https://helm.sh/docs/chart_best_practices/labels/)
* [Recommended Labels](https://kubernetes.io/docs/concepts/overview/working-with-objects/common-labels/)

##### Нужно задавать лимиты ресурсов

Ссылки:

* [Setting and Rightsizing Kubernetes Resource Limits | Best Practices](https://www.containiq.com/post/setting-and-rightsizing-kubernetes-resource-limits)
* [Kubernetes best practice: How to (correctly) set resource requests and limits](https://www.cncf.io/blog/2022/10/20/kubernetes-best-practice-how-to-correctly-set-resource-requests-and-limits/)

##### Не использовать SubCharts без необходимости

При работе с Helm нужно придерживаться правила: один chart содержит в себе одно приложение. Если приложению для запуска
требуются другие ресурсы (БД, очередь и т.п.), то их нужно разворачивать отдельно.

В противном случае получится _umbrella_ chart, который будет содержать в себе больше одного ресурса, а следовательно
будет чрезмерно усложнен.

Если требуется задеплоить N одинаковых приложений, но с немного разными параметрами, то лучше это делать по-отдельности.
Использовать SubChart с шаблоном, а на верхнем уровне в dependencies прописывать зависимости, плохо, т.к. chart
становится ответственным за группу ресурсов, принадлежащих ему лишь косвенно (они однотипные, но не одинаковые).

Ссылки:

* [HELM Best practices](https://codefresh.io/docs/docs/new-helm/helm-best-practices/#charts-and-sub-charts)

##### Использовать liveness и readiness probes

Использование liveness (контейнер живой) и readiness (готов принимать трафик) probes позволяет Kubernetes понять
состояние приложения.

Без liveness probe может получиться что приложение потеряло connect к БД, но не завершилось аварийно (например, Spring
Boot). Приложение не может обрабатывать трафик и требует перезапуска, но сам контейнер еще живой, следовательно,
Kubernetes не будет предпринимать никаких мер.

Без readiness probe может получиться ситуация, что контейнер запущен, но еще не готов принимать трафик, т.к. прогревает
кэши или ждет настройки от внешней системы. Kubernetes будет знать ничего об этом и сразу выставит его в балансировку,
что приведет к ошибкам.

Ссылки:

* [Kubernetes Readiness & Liveliness Probes — Best Practices](https://medium.com/metrosystemsro/kubernetes-readiness-liveliness-probes-best-practices-86c3cd9f0b4a)

##### Использовать контейнеры маленького размера

В зависимости от политики `imagePullPolicy` Kubernetes при обновлении deployment скачивает новый образ. Чем быстрее
будет загружен новый образ, тем быстрее начнется перезапуск. Размер образа напрямую влияет на скорость скачивания.

Т.к. образ — это коллекция других образов, размер образа равен сумме размеров образов, его составляющих. Каждая
дополнительная инструкция в `Dockerfile` увеличивает общий размер образа. Соответственно, чтобы уменьшить результирующий
размер образа:

* нужно объединять однотипные команды;
* использовать максимально компактный базовый образ, например на базе Alpine Linux;
* использовать multistage build, чтобы не тащить в результирующий образ лишнее.

##### Структуры предпочтительнее массивов

При использовании массивов сложнее прописывать желаемые значения при установке релиза.

```yaml
servers:
  - name: foo
    port: 8080
  - name: bar
    port: 8081
```

```shell
$ helm install my-release \
    --set servers[1].port=8180 \
    java-service
```

```yaml
servers:
  foo:
    port: 8080
  bar:
    port: 8081
```

```shell
$ helm install my-release \
    --set servers.bar.port=8080 \
    java-service
```

##### Документировать Charts

* `README.md` для описания chart и его переменных.
* `NOTES.txt` – информация о релизе, какие ресурсы были установлены.

##### Обновлять Deployment когда меняется ConfigMap

По-умолчанию в Kubernetes при изменении ConfigMap перезапуск Deployment не происходит. Чтобы добавиться этого поведения
можно в `annotations` прописать checksum от ConfigMap: при изменении ConfigMap изменится аннотация и deployment будет
переустановлен.

```yaml
kind: Deployment
spec:
  template:
    metadata:
      annotations:
        checksum/config: { { include (print $.Template.BasePath "/configmap.yaml") . | sha256sum } }
```

### Создаем Helm Chart repository

Helm Chart repository – это сервер, который хранит `index.yaml`, содержащий информацию из `Chart.yaml` и ссылку на архив
с манифестами.

##### GitHub Pages as Helm Chart Repository

GitHub Pages — это общедоступные веб-страницы, размещенные и опубликованные через GitHub. Для создания сайта нужно
создать _пустую_ ветку `gh-pages` и добавить в нее необходимые файлы:

* `.gitignore` – убираем лишние файлы из индекса (аналогично master);
* `index.md` – контент страницы;
* `_config.yaml` – тема (используем cayman).

```shell
# создает ветку без истории
$ git checkout --orphan gh-pages
# удаляем все файлы
$ git reset --hard
# add, commit and push
$ git add *
$ git commit -m "init commit"
$ git push origin gh-pages
```

Сайт по адресу [https://romanow.github.io/helm-charts/](https://romanow.github.io/helm-charts/).

![GitHub Pages](images/GitHub%20Pages.png)

##### Публикация изменений с помощью GitHub Actions

В [main.yaml](../.github/workflows/charts-release.yaml) прописываем запуск публикации только при изменении `charts/**`.

Для публикации используем [chart-releaser-action](https://github.com/marketplace/actions/helm-chart-releaser). Он
собирает charts в архив и публикует их как package. После этого публикует файл `index.yaml` с информацией о charts в
ветку `gh-pages` и запускает ее пересборку.

![Helm index](images/Helm%20index.png)

После успешного завершения сборки проверяем репозиторий:

```shell
$ helm repo add romanow https://romanow.github.io/helm-charts/
"romanow" has been added to your repositories

$ helm search repo romanow
NAME                            CHART VERSION   APP VERSION     DESCRIPTION
romanow/elasticsearch           1.3.0           7.17.8          Elasticsearch is a distributed, RESTful search ...
romanow/frontend                1.3.0           v1.0            Frontend application running in nginx, based on...
romanow/grafana                 1.3.0           8.3.4           Grafana allows you to query, visualize, alert o...
romanow/influxdb                1.3.0           1.8.4           The Time Series Data Platform where developers ...
romanow/jaeger-query            1.3.0           1.41.0          Jaeger is a distributed tracing system released...
romanow/java-service            1.3.0           v1.0            Helm chart for Spring Boot application with log...
romanow/kibana                  1.3.0           7.17.8          Kibana is a free and open user interface that l...
romanow/logstash                1.3.0           7.17.8          Logstash is a free and open server-side data pr...
romanow/node-exporter           1.3.0           1.5.0           Prometheus exporter for hardware and OS metrics...
romanow/postgres                1.3.2           15              PostgreSQL is a powerful, open source object-re...
romanow/prometheus              1.3.0           2.40.0          Prometheus collects and stores its metrics as t...
```

##### Создаем репозиторий в ArtifactHUB

[ArtifactHUB](https://artifacthub.io/) – это веб-приложение, которое позволяет находить, устанавливать и публиковать
Helm charts. ArtifactHUB не хранит пакеты, а только связывает их с репозиторием.

Авторизуемся через GitHub и создаем Helm Chart репозиторий. Для этого указываем адрес репозитория на
GitHub: `https://romanow.github.io/helm-charts-lecture`.

![Create repo in ArtifactHUB](images/ArtifactHUB%20add%20repo.png)

После создания репозитория, подтвердим, что являемся его автором: для этого создаем
файл [`artifacthub-repo.yml`](https://github.com/Romanow/helm-charts/blob/gh-pages/artifacthub-repo.yml) и в нем
указываем `repositoryID` и `owners`.

Ждем некоторое время (~20 минут) пока ArtifactHUB проиндексирует наш репозиторий и после заходим и проверяем как он
выглядит.

![ArtifactHUB repos](images/ArtifactHUB%20repos.png)

### Создание документации с помощью helm-docs

[Helm Docs](https://github.com/norwoodj/helm-docs) – инструмент для автоматической генерации README.md на базе helm
charts. Результирующий файл содержит информацию о Chart и его параметрах (`values.yaml`). В основе лежат шаблоны go&
Helm Docs анализирует метаданные из Chart и создает ряд вспомогательных шаблонов, на которые можно ссылаться в основном
файле шаблона (по умолчанию [`README.md.gotmpl`](../charts/postgres/README.md)).

### Создание правил валидации

[Pre-commit Framework](https://pre-commit.com) – это менеджер скриптов для pre commit hooks. Вы задаете список проверок
и действий, которые нужно выполнить, а pre-commit скачивает нужные ресурсы и выполняет эти скрипты. Тем самым он дает
возможность легкого переноса pre-commit скриптов между проектами.

Конфигурация проверок описана в [.pre-commit-config.yaml](../.pre-commit-config.yaml), для запуска проверки нужно
выполнить:

```shell
$ pre-commit run --all-files
```

Но добавить pre-commit в git hooks нельзя, т.к. [chart-releaser-action](../.github/workflows/charts-release.yaml)
публикует `index.yaml` в ветку `gh-pages` через commit, а pre-commit ему в этом мешает.

Поэтому с pre-commit работаем как с инструментом валидации: добавляем его в GitHub Actions и при прогоне CI/CD если
какая-то проверка завершилась неудачно, то сборка падает.

Helm Docs добавляем как задачу в pre-commit и в GitHub Actions проверяем актуальность документации. Если есть отличия,
то сборка падает. Это добавляет ряд неудобств: на шаге прогона тестов и публикации происходит проверка измененных файлов
в commit и если сборка упала на этапе валидации, то после исправления index не будет содержать измененных файлов.

### Тестирование Helm Charts

Мы создали репозиторий для Helm Charts, запустили linter и сделали документацию, но остается самый главный вопрос: а
работают ли charts после внесенных изменений.

Для тестирования будем использовать [chart-testing](https://github.com/helm/chart-testing) от helm
и [kind](https://kind.sigs.k8s.io/) – легковесный k8s кластер, запускаемый в docker.

Мы запускаем кластер k8s с помощью kind, kubectl смотрит на этот кластер, а `ct` (chart-testing) просто
выполняет `helm install <release-name> charts/<chart> --namespace <custom-namespace>`, проверяет статус, что все ресурсы
создались, потом выполняет `helm uninstall <release-name> --namespace <custom-namespace>`.

`ct` предназначен для работы с Pull Request и он запускает тесты не на все charts, а только на те, которые изменились.
Т.к. в текущем примере мы делаем commit прямо в `master`, нам надо получить список измененных charts вручную. Для этого
используем action [tj-actions/changed-files](https://github.com/marketplace/actions/changed-files), который нам вернет
список измененных папок в charts/**.

```yaml
- name: Get changed files
  uses: tj-actions/changed-files@v35
  with:
    json: true
    dir_names: true
    dir_names_max_depth: 2
    files: |
      charts/**
```

Для ускорения тестов будем их запускать параллельно
через [matrix build](https://docs.github.com/en/actions/using-jobs/using-a-matrix-for-your-jobs). Для этого список
измененных charts с шага `validate` передадим на вход `test`.

```yaml
jobs:
  validate:
    runs-on: ubuntu-latest
    outputs:
      matrix: |
        {
          "chart": ${{ steps.set-matrix.outputs.charts }}
        }
    steps:
      .....

  test:
    runs-on: ubuntu-latest
    needs: validate
    strategy:
      matrix: ${{ fromJson(needs.validate.outputs.matrix) }}
    steps:
      .....

      # запускаем кластер k8s
      - name: Create kind cluster
        uses: helm/kind-action@v1.4.0

      # вызываем helm install на конкретный chart
      - name: Run ct install
        run: ct lint-and-install --config=.ct.yaml --charts ${{ matrix.chart }}
```

![Github Action test all](images/Github%20Action%20test%20all.png)
