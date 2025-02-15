## Provision Bare Metal Nodes
```
kustomize build omni/apps/argocd/argocd | yq -i 'with(.cluster.inlineManifests.[] | select(.name=="argocd"); .contents=load_str("/dev/stdin"))' omni/infra/patches/argocd.yaml
```

```
brew install helm
helm repo add cilium https://helm.cilium.io/
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm show chart cilium/cilium  | grep version
helm show chart prometheus-community/kube-prometheus-stack | grep version

cd /omni/apps/kube-system/cilium
helm dependency build

cd ../../../infra/patches
helm template cilium ../../apps/kube-system/cilium --namespace kube-system | yq -i 'with(.cluster.inlineManifests.[] | select(.name=="cilium"); .contents=load_str("/dev/stdin"))' cilium.yaml

helm template cilium omni/apps/kube-system/cilium --namespace kube-system | yq -i 'with(.cluster.inlineManifests.[] | select(.name=="cilium"); .contents=load_str("/dev/stdin"))' omni/infra/patches/cilium.yaml
```

Add the following values to `/omni/apps/kube-system/cilium/values.yaml`:
```
forwardKubeDNSToHost=true
bpf.masquerade: true
kubeProxyReplacement: true
gatewayAPI.enabled: true
gatewayAPI.enableAlpn: true
gatewayAPI.enableAppProtocol: true
gatewayAPI.hostNetwork.enabled: true
envoy.enabled: true
debug.enabled: true
debug.verbose: flow
enableIPv4Masquerade: true
enableIPv6Masquerade: true
```

1. [Install and Configure omnictl](https://omni.siderolabs.com/how-to-guides/install-and-configure-omnictl)
2. Create Machine Classes
   ```
   omnictl apply -f machine-classes/metal-controlplane.yaml
3. Create the Cluster
   ```shell
   omnictl cluster template sync --file cluster-template.yaml
   ```

Download config files for new cluster:
```
omnictl kubeconfig -c router-gateway
omnictl talosconfig -c router-gateway
```