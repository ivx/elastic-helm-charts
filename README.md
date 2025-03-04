# Elastic Stack Kubernetes Helm Charts

This is a fork of the [Elastic Helm Charts repository](https://github.com/elastic/helm-charts).

The original repo is archived and [Elastic Cloud on
Kubernetes](https://github.com/elastic/cloud-on-k8s) is now the recommended way
to run Elastic on Kubernetes. However, we only need a tiny subset of the
applications and decided to create a fork.

## Supported Configurations

We recommend that the Helm chart version is aligned to the version of the
product you want to deploy, when a chart release exists for the given stack
version. This will ensure that you are using a chart version
that has been tested against the corresponding production version.
This will also ensure that the documentation and examples for the chart will
work with the version of the product, you are installing.

For example, if you want to deploy an Elasticsearch `7.7.1` cluster, use the
corresponding `7.7.1` [tag][elasticsearch-771].

However, we don't expect to release new charts versions, so if a chart for the
latest patch version doesn't exist, you can use the latest chart with the same
**MAJOR.MINOR** version and override the Docker image tag to the latest patch
version with the `imageTag` value.

For example, if you want to deploy an Elasticsearch `7.17.5` cluster, use the
corresponding `7.17.3` [tag][elasticsearch-7173], with `imageTag=7.17.5` value.

### Stack Versions

| Chart                                      | Latest 8 Version                            | Latest 7 Version                             | Latest 6 Version                   |
|--------------------------------------------|---------------------------------------------|----------------------------------------------|------------------------------------|
| [APM Server](./apm-server/README.md)       | [`8.5.1`][apm-8] (Beta since 7.7.0)         | [`7.17.3`][apm-7] (Beta since 7.7.0)         | [`6.8.22`][apm-6] (Alpha)          |
| [Elasticsearch](./elasticsearch/README.md) | [`8.5.1`][elasticsearch-8] (GA since 7.7.0) | [`7.17.3`][elasticsearch-7] (GA since 7.7.0) | [`6.8.22`][elasticsearch-6] (Beta) |
| [Filebeat](./filebeat/README.md)           | [`8.5.1`][filebeat-8] (GA since 7.7.0)      | [`7.17.3`][filebeat-7] (GA since 7.7.0)      | [`6.8.22`][filebeat-6] (Beta)      |
| [Kibana](./kibana/README.md)               | [`8.5.1`][kibana-8] (GA since 7.7.0)        | [`7.17.3`][kibana-7] (GA since 7.7.0)        | [`6.8.22`][kibana-6] (Beta)        |
| [Logstash](./logstash/README.md)           | [`8.5.1`][logstash-8] (Beta since 7.5.0)    | [`7.17.3`][logstash-7] (Beta since 7.5.0)    | [`6.8.22`][logstash-6] (Beta)      |
| [Metricbeat](./metricbeat/README.md)       | [`8.5.1`][metricbeat-8] (GA since 7.7.0)    | [`7.17.3`][metricbeat-7] (GA since 7.7.0)    | [`6.8.22`][metricbeat-6] (Beta)    |

### Kubernetes Versions

The charts are [currently tested][] against all GKE versions available. The
exact versions are defined under `KUBERNETES_VERSIONS` in
[helpers/matrix.yml][].

### Helm Versions

While we are checking backward compatibility, the charts are only tested with
Helm version mentioned in [helm-tester Dockerfile][] (currently 3.10.2).

[apm-6]: https://github.com/elastic/helm-charts/tree/6.8/apm-server/README.md
[apm-7]: https://github.com/elastic/helm-charts/tree/7.17/apm-server/README.md
[apm-8]: https://github.com/elastic/helm-charts/tree/main/apm-server/README.md
[currently tested]: https://devops-ci.elastic.co/job/elastic+helm-charts+main/
[eck-charts]: https://github.com/elastic/cloud-on-k8s/tree/master/deploy
[elastic cloud on kubernetes]: https://github.com/elastic/cloud-on-k8s
[elasticsearch-6]: https://github.com/elastic/helm-charts/tree/6.8/elasticsearch/README.md
[elasticsearch-7]: https://github.com/elastic/helm-charts/tree/7.17/elasticsearch/README.md
[elasticsearch-7173]: https://github.com/elastic/helm-charts/tree/7.17.3/elasticsearch/
[elasticsearch-771]: https://github.com/elastic/helm-charts/tree/7.7.1/elasticsearch/
[elasticsearch-8]: https://github.com/elastic/helm-charts/tree/main/elasticsearch/README.md
[filebeat-6]: https://github.com/elastic/helm-charts/tree/6.8/filebeat/README.md
[filebeat-7]: https://github.com/elastic/helm-charts/tree/7.17/filebeat/README.md
[filebeat-8]: https://github.com/elastic/helm-charts/tree/main/filebeat/README.md
[helm-tester Dockerfile]: https://github.com/elastic/helm-charts/blob/main/helpers/helm-tester/Dockerfile
[helpers/matrix.yml]: https://github.com/elastic/helm-charts/blob/main/helpers/matrix.yml
[kibana-6]: https://github.com/elastic/helm-charts/tree/6.8/kibana/README.md
[kibana-7]: https://github.com/elastic/helm-charts/tree/7.17/kibana/README.md
[kibana-8]: https://github.com/elastic/helm-charts/tree/main/kibana/README.md
[logstash-6]: https://github.com/elastic/helm-charts/tree/6.8/logstash/README.md
[logstash-7]: https://github.com/elastic/helm-charts/tree/7.17/logstash/README.md
[logstash-8]: https://github.com/elastic/helm-charts/tree/main/logstash/README.md
[metricbeat-6]: https://github.com/elastic/helm-charts/tree/6.8/metricbeat/README.md
[metricbeat-7]: https://github.com/elastic/helm-charts/tree/7.17/metricbeat/README.md
[metricbeat-8]: https://github.com/elastic/helm-charts/tree/main/metricbeat/README.md
