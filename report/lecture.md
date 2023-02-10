# Очумелые ручки: делаем свой Helm Chart Repository из подручных средств

### Что такое Helm Charts, какие задачи он решает

### Best Practice и правила оформления `Chart.yaml`

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
romanow/jaeger-collector        1.3.0           1.41.0          Jaeger is a distributed tracing system released...
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

### Тестирование Helm Charts
