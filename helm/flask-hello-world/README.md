# flask-hello-world Helm Chart

This chart deploys the `flask-hello-world` application.

## Quickstart

```bash
# From this chart directory
helm dependency update || true
helm install myapp . --namespace default --create-namespace \  --set image.repository=yossibronshtein/flask-hello-world \  --set image.tag=1.0.0
```

## Values

See `values.yaml` for configurable parameters.

## Package and Push to OCI (GHCR example)

```bash
# Enable OCI
export HELM_EXPERIMENTAL_OCI=1

# Login to GHCR (use a PAT with write:packages)
echo $GHCR_TOKEN | helm registry login ghcr.io -u <your-username> --password-stdin

# Package chart
helm package .

# Push
CHART_PKG=$(ls flask-hello-world-*.tgz | tail -n1)
helm push $CHART_PKG oci://ghcr.io/<your-org-or-user>/helm
```

## Pull and Install from OCI

```bash
export HELM_EXPERIMENTAL_OCI=1
helm pull oci://ghcr.io/<your-org-or-user>/helm/flask-hello-world --version 0.1.0
helm install myapp ./flask-hello-world-0.1.0.tgz
```

## Alternative: ChartMuseum/Harbor

```bash
helm repo add mycharts https://<chartmuseum-or-harbor>/charts
helm package .
helm push-artifactory flask-hello-world-0.1.0.tgz mycharts || helm cm-push flask-hello-world-0.1.0.tgz mycharts
```
