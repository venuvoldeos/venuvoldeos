# 🧪 Real-Time Use Cases & Scenarios for KubeCon 2025 Topics

## Platform Engineering
**Scenario:** Your dev team wastes time configuring infrastructure. You create an internal developer platform (IDP) with reusable templates, CI/CD pipelines, and service catalogs to boost productivity.

---

## ArgoCD
**Use Case:** Automatically sync your app with Git changes. If someone updates the YAML in the Git repo, ArgoCD reflects that in the cluster.

**Scenario:** A developer commits a new service YAML file → ArgoCD detects the change → Deploys the new service in minutes.

---

## Helm
**Use Case:** Install or upgrade applications like Prometheus or NGINX using reusable templates.

**Scenario:** You want to deploy Prometheus in your staging cluster with default configs. Just run: `helm install prometheus prometheus-community/prometheus`.

---

## Kyverno
**Use Case:** Enforce security policies across clusters.

**Scenario:** Prevent all users from deploying containers as root. Kyverno blocks any deployment that violates this rule.

---

## KEDA
**Use Case:** Event-driven auto-scaling.

**Scenario:** You have a Kafka queue. When messages increase, KEDA scales consumers automatically. No need to over-provision pods.

---

## Istio + Envoy (Service Mesh)
**Use Case:** Encrypt all service-to-service communication and add metrics/tracing.

**Scenario:** Your company handles sensitive user data. Use Istio to auto-inject Envoy sidecars to encrypt traffic and visualize communication.

---

## ODIGOS
**Use Case:** Auto-collect logs, metrics, and traces from your apps.

**Scenario:** Devs don't want to manually add instrumentation. ODIGOS auto-discovers and sends data to your monitoring stack.

---

## Thanos
**Use Case:** Add long-term, highly available storage to Prometheus metrics.

**Scenario:** You want to store metrics for 1 year and make them queryable even if Prometheus restarts.

---

## vCluster
**Use Case:** Allow multiple teams to use isolated environments in the same physical Kubernetes cluster.

**Scenario:** Team A needs a cluster with Istio, Team B needs a clean slate. Create two vClusters for full isolation.

---

## Kubernetes Operator
**Use Case:** Automate complex application lifecycles.

**Scenario:** Deploy a database (like PostgreSQL) with auto-backups, upgrades, and health checks using its Kubernetes Operator.

---

## Stateful Node / CSI / Block Storage
**Use Case:** Run a database with persistent volumes.

**Scenario:** Deploy a MySQL pod using CSI provisioned block storage. Data survives pod restart or relocation.

---

## Ingress Gateway
**Use Case:** Expose services via a single endpoint.

**Scenario:** Host multiple apps (`api.myapp.com`, `ui.myapp.com`) using one IP and route traffic using rules.

---

## GPUs in AI
**Use Case:** Accelerate deep learning model training.

**Scenario:** Train an image recognition model with PyTorch on a node with 4 GPUs, cutting training time from days to hours.

---

## Harbor
**Use Case:** Host private Docker images securely.

**Scenario:** Your team builds a custom app. You push it to a Harbor registry that scans for vulnerabilities and enforces role-based access.

---

## Service Catalogue
**Use Case:** Offer self-service provisioning of services.

**Scenario:** A developer wants a database. They go to the internal platform’s catalogue and click “Provision Postgres” – done!

---

## RPC / gRPC
**Use Case:** Fast and structured service communication.

**Scenario:** Microservices A and B need to talk. You use gRPC for low-latency communication with built-in protobuf serialization.

---

## Killer.sh
**Use Case:** Practice for Kubernetes certification.

**Scenario:** You're preparing for the CKA exam. You use Killer.sh’s realistic labs and test your knowledge in a simulated environment.

---

## Sidecar Pattern
**Use Case:** Add logging or proxy functionality without changing your app.

**Scenario:** You add a sidecar container to handle request logging for your Node.js app container.

---

## Proxy-less Service Mesh
**Use Case:** Reduce latency and resource usage in service meshes.

**Scenario:** You run thousands of pods and want to avoid running thousands of Envoy sidecars. You implement a mesh that uses eBPF or shared proxies.

---

## Nutanix Kubernetes Visualization
**Use Case:** Visually monitor and manage Kubernetes on Nutanix infra.

**Scenario:** Your infra team uses Nutanix and wants to see cluster health, pod usage, and app performance from a GUI.

---

## Harvester
**Use Case:** Manage VMs and containers in a unified way.

**Scenario:** You want to deploy legacy apps as VMs and modern apps as containers – manage both from Harvester.

---

## Control Plane / Endpoints
**Use Case:** Core orchestration & service discovery.

**Scenario:** Kubernetes Control Plane checks node/pod health, while Endpoints track actual pods behind a Service to route traffic.

---

## Platform Engineering Associate - CNPA
**Use Case:** Validate entry-level cloud-native and platform engineering skills.

**Scenario:** You're entering DevOps or Platform roles. This cert gives you credibility and practical skills in tools like K8s, Helm, GitOps.

---