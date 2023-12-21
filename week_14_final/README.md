# 极客时间 | 云原生 DevOps 进阶实战营 | 大作业

## 1. 要求与备注

### 1.1 要求

- 使用 Terraform 开通一台腾讯云 CVM 并安装 K3s (`集群-1`) 并在 `集群-1` 内安装 Jenkins, ArgoCD
- 使用 Terraform 开通两台腾讯云 CVM 并分别安装 K3s (`集群-2`, `集群-3`) 并实现以下要求:
  - 使用 `集群-1` 作为 Terraform Kubernetes Backend 后端存储
  - 将 IaC 源码存储在 GitHub 代码仓库中
  - 在 `集群-1` 作的 Jenkins 中配置流水线实现在 IaC 代码变更时自动触发变更 `Jenkinsfile`
- 在 `集群-1` 的 ArgoCD 实例中添加 `集群-2`, `集群-3`
- 使用一个 `ApplicationSet` + `List Generators` 在 `集群-2`, `集群-3` 内的 `default` 命名空间下同时部署示例应用 `BookInfo` (Helm 源码见: `iac/lastwork/bookinfo`)
- 示例应用部署完成后, 实现以下架构:

![Arch](assets/img-01-arch.webp)

### 1.2 备注

- 这是一个理想的多云灾备部署场景, `集群-1, 2, 3` 可能分别部署在不同云厂商
- `集群-1` 的 Proxy 作为流量入口对外提供服务, 并对部署在 `集群-2`, `集群-3` 的无状态示例应用 `BookInfo` 做负载均衡

---

## 02 | 实现与运行

- 参考了优秀同学的[作业](https://github.com/sawyer523/geektime-devops/tree/main/week14), 修复了一些小细节
- 本次作业使用腾讯云作为云厂商, 需要登录腾讯云账号获取 Secret ID 和 Secret Key 并配置到本地 (生产环境注意使用安全的方式管理)

```shell
export TF_VAR_secret_id=YOUR_SECRET_ID
export TF_VAR_secret_key=YOUR_SECRET_KEY
```

- 同时我们还需要 GitHub 的 Personal Access Token, 用于在 Jenkins 中拉取代码仓库

```shell
export TF_VAR_github_personal_token=YOUR_GITHUB_TOKEN
```

- 使用 Terraform 拉进起环境

```shell
terraform init
terraform apply --auto-approve
```
