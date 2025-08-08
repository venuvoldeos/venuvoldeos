# 🚀 KubeCon 2025 Jargon Simplified

## 🧱 Platform Engineering
**Platform Engineering** is about building internal platforms that help developers deploy, run, and manage their applications efficiently. Think of it like creating a self-service dashboard or toolbox for developers.

### 🔹 CNPA (Cloud Native Platform Associate)
A certification that validates your understanding of cloud-native tools and platform engineering fundamentals.

## ⚙️ Kubernetes Core Concepts
### 🔹 Control Plane
The **brain** of Kubernetes. It decides what should run where and handles scheduling, scaling, and health checks.

### 🔹 Kubernetes Workload
Applications or services running inside the cluster (like Deployments, StatefulSets, etc.)

### 🔹 Kubernetes Manifest
YAML files used to define workloads, services, volumes, etc., in Kubernetes.

### 🔹 Kubernetes Operators
Custom controllers that manage complex applications (like databases) automatically inside Kubernetes.

## 🔁 DevOps & GitOps Tools
### 🔹 ArgoCD
A GitOps tool for continuous deployment. It watches a Git repo and ensures your Kubernetes cluster always matches the code in that repo.

### 🔹 Helm
A package manager for Kubernetes – like `apt` for Linux or `brew` for macOS, but for apps on Kubernetes.

### 🔹 Chainsaw & Kyverno
- **Kyverno**: A policy engine for Kubernetes – enforces rules like "no containers should run as root".
- **Chainsaw**: A test automation tool designed for Kubernetes.

### 🔹 Killer.sh
A platform that helps you practice for Kubernetes certifications using hands-on labs.

## 🧪 Observability & Monitoring
### 🔹 ODIGOS
Simplifies observability by automatically collecting telemetry data (logs, metrics, traces) from your Kubernetes apps.

### 🔹 Thanos (CNCF Project)
Adds long-term storage and high availability to **Prometheus**, which is a monitoring tool.

## ⚡ Auto-scaling & Performance
### 🔹 What is Autoscaling?
Automatically increases or decreases app instances based on CPU, memory, or other metrics.

### 🔹 KEDA (Kubernetes Event-Driven Autoscaler)
Scales applications based on external events like queue size in Kafka or messages in RabbitMQ.

## 🔄 Service Mesh & Communication
### 🔹 Service Mesh
Manages how microservices communicate, handle retries, encryption, and observability.

### 🔹 Istio / Envoy
- **Istio**: A popular service mesh.
- **Envoy**: A high-performance proxy used by Istio.

### 🔹 Sidecar in DevOps
A side process (like a logging or security agent) that runs alongside your main app in the same pod.

### 🔹 Proxy-less Service Mesh
A new approach that removes the need for sidecars, reducing overhead.

### 🔹 gRPC
A fast, efficient way for services to talk to each other, especially in microservice architectures.

### 🔹 Ingress Gateway
Manages external access to services inside the cluster (like a reverse proxy).

## 🧩 Cloud & Virtualization Tools
### 🔹 VMware VCF / VKS / Cloud Foundry
VMware tools for managing cloud infrastructure and deploying apps.

### 🔹 Nutanix Kubernetes Visualization
UI tools that show Kubernetes workloads on Nutanix platforms.

### 🔹 Harvester
A cloud-native Hyperconverged Infrastructure (HCI) solution to manage VMs and containers together.

### 🔹 vCluster
A tool to create virtual Kubernetes clusters inside a single physical cluster for multi-tenancy.

### 🔹 Tenants and Clusters
Multi-tenant setups isolate different teams/apps in shared or separate clusters.

## 🧱 Identity, Access, and Configuration
### 🔹 Identity Provider
Handles user authentication (login), like Google or Okta.

### 🔹 Service Catalogue
A list of available services developers can use, like databases or message queues.

### 🔹 Data Model - Fixed vs. Flexible
- **Fixed**: Pre-defined schema.
- **Flexible**: Schema-less or dynamic structure (like NoSQL databases).

## 📦 Storage & Volume Management
### 🔹 File vs. Block Storage
- **File Storage**: Data saved as files (e.g., NFS).
- **Block Storage**: Raw volumes treated as blocks (e.g., EBS in AWS).

### 🔹 CSI Storage (Container Storage Interface)
Standard for how storage is attached to containers in Kubernetes.

### 🔹 Stateful Node
A Kubernetes node that stores persistent data (used in StatefulSets).

## 🧠 AI & Kubernetes
### 🔹 GPUs in AI
Graphics Processing Units speed up model training, especially for large AI models.

### 🔹 AI Model Training
The process of feeding data to an AI model so it can learn patterns and make predictions.

## 🌐 Other Technical Terms
### 🔹 RPC Calls (Remote Procedure Calls)
A way for one program to request a function or service from another over the network.

### 🔹 Endpoints
Kubernetes tracks where a service can be accessed – these are the **actual pods** behind the service.

### 🔹 Docker Hub / Harbor
- **Docker Hub**: Public image registry.
- **Harbor**: A private, secure container registry for enterprises.

### 🔹 Micro
Refers to **Microservices** – small, independently deployable components of an application.

### 🔹 SLB Egress
**SLB** = Server Load Balancer; Egress = outbound traffic. SLB egress means managing outbound traffic with load balancers.