# Download and Extract the Omni Image
1. Sign up for [Omni](https://signup.siderolabs.io/)
2. Login to your instance
3. Select "Download Installation Media"
4. Keep the defaults (`AWS AMI (amd64)` and the latest version of Talos), and click "Download".
5. Extract the downloaded file: `xz -d path_to_omni_image > aws-amd64-talos-v1.7.6.raw`

# Provision a Kubernetes Cluster
## Fork and Clone the Repository
1. Fork this repository
2. `git clone` your fork

## Update the ArgoCD ApplicationSet template
1. Update the `REPO_FORK` environment variable in the script below to the URL of your repository. On Mac, the required tools can be downloaded using [Homebrew](https://brew.sh/): `brew install gsed kustomize yq`
   ```shell
   REPO_FORK="https://github.com/cassamajor/example.git"
   REPO_SOURCE="https://github.com/cassamajor/talos-pipeline.git"
   gsed -i "s|$REPO_SOURCE|$REPO_FORK|" omni/apps/argocd/argocd/bootstrap-app-set.yaml
   kustomize build omni/apps/argocd/argocd | yq -i 'with(.cluster.inlineManifests.[] | select(.name=="argocd"); .contents=load_str("/dev/stdin"))' omni/infra/patches/argocd.yaml
   ```
2. Commit the changes and push to your repository.

## Provision EC2 Instances
From the root of the repository, run:
1. `cd terraform`
2. `terraform init`
3. `terraform plan -out tf.plan`
4. `terraform apply tf.plan`

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
   
## Cluster Teardown
When you're ready to tear down the cluster, run the following to keep your custom Omni image and S3 bucket:
   ```shell
   terraform plan -out tf.plan -target module.talos -destroy
   ```