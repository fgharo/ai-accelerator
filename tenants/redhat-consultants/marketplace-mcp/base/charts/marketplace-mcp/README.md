# marketplace-mcp Helm Chart

Helm chart for deploying Marketplace MCP server, including:
- Deployment
- Service
- Openshift Route (optional, enabled by default)

## Chart Location

./marketplace-mcp

## Prerequisites
- Kubernetes cluster
- Helm 3.x
- Openshift Route API if route is enabled

## Quick Start

From the chart directory:

```bash
cd marketplace-mcp
helm dependency update
helm lint .
helm template marketplace-mcp
```


Install into a namespace

```bash
helm upgrade --install marketplace-mcp . \
    --namespace llama-stack  \
    --create-namespace
```

## Common Operations

Render manifests locally:

```bash
helm template marketplace-mcp .
```

Dry-run an upgrade:
```bash
helm upgrade --install marketplace-mcp . \
    --namespace llama-stack  \
    --dry-run --debug
```

Uninstall:

```bash
helm uninstall marketplace-mcp --namespace llama-stack
```

## Values

Default values are defined in the values.yaml

Most commonly overridden values:
- replicaCount
- image.repository
- image.tag
- image.pullPolicy
- resources
- envFrom.configMapRef.name
- envFrom.secretRef.name
- service.type
- route.enabled
- route.annotations
- route.tls

## Example Overrides

Use an override file, for example values-dev.yaml

```yaml
replicaCount: 1

image:
    repository: quay.io/user15/marketplace-mcp-server
    tag: latest
    pullPolicy: Always

envFrom:
    configMapRef:
        enabled: true
        name: marketplace-mcp-config
    secretRef:
        enabled: true
        name: marketplace-mcp

route:
    enabled: true
```

Install with overrides:

```bash
helm upgrade --install marketplace-mcp . \
    --namespace llama-stack \ 
    -f values-dev.yaml
```

## Route Notes

If deploying to a non-Openshift Kubernetes cluster, disable Route creation:

```bash
helm upgrade --install marketplace-mcp . \
    --namespace llama-stack \ 
    --set route.enabled=false
```

