# Download and Extract the Omni Image
1. Sign up for [Omni](https://signup.siderolabs.io/)
2. Login to your instance
3. Select "Download Installation Media"
4. Keep the defaults (`AWS AMI (amd64)` and the latest version of Talos), and click "Download".
5. Extract the downloaded file: `xz -d path_to_omni_image > disk.raw`

# Provision a Kubernetes Cluster
## Clone the Repository
1. Fork this repository
2. `git clone` your fork

## Provision EC2 Instances
1. `cd` into `terraform`
2. `terraform init`
3. `terraform plan -out tf.plan`
4. `terraform apply tf.plan`

## Update the ArgoCD ApplicationSet template
1. Update the `REPO_FORK` environment variable in the script below to the URL of your repository. On Mac, the required tools can be downloaded using [Homebrew](https://brew.sh/): `brew install gsed kustomize yq`
   ```shell
   REPO_SOURCE="https://github.com/cassamajor/talos-pipeline.git"
   REPO_FORK="https://github.com/cassamajor/example.git"
   gsed -i "s|$REPO_SOURCE|$REPO_FORK|" omni/apps/argocd/argocd/bootstrap-app-set.yaml
   kustomize build omni/apps/argocd/argocd | yq -i 'with(.cluster.inlineManifests.[] | select(.name=="argocd"); .contents=load_str("/dev/stdin"))' omni/infra/patches/argocd.yaml
   ```
2. Commit the changes and push to your repository.

## Cluster Automation
1. [Install and Configure omnictl](https://omni.siderolabs.com/how-to-guides/install-and-configure-omnictl)
2. Create Machine Classes
   ```shell
   cd omni/infra/
   omnictl apply -f machine-class-controlplane.yaml
   omnictl apply -f machine-class-worker.yaml
   ```
3. Create the Cluster
   ```shell
   omnictl cluster template sync --file cluster-template.yaml
   ```