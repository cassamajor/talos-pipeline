# Download and Extract the Omni Image
1. Sign up for [Omni](https://signup.siderolabs.io/)
2. Login to your instance
3. Select "Download Installation Media"
4. Keep the defaults (`AWS AMI (amd64)` and the latest version of Talos), and click "Download".
5. Extract the downloaded file: `xz -d path_to_omni_image > disk.raw`

# Create EC2 Instances
1. Fork [cassamajor/talos-pipeline](https://github.com/cassamajor/talos-pipeline)
2. git clone your repository
3. `cd` into `terraform`
4. `terraform init`
5. `terraform plan -out tf.plan`
6. `terraform apply tf.plan`

# Create a Kubernetes Cluster
1. Update the ArgoCD ApplicationSet template: change "your-repo-name" in the text below to the name of your repository.
   ```shell
   sed -i 's|https://github.com/siderolabs/contrib.git|your-repo-name|' apps/argocd/argocd/bootstrap-app-set.yaml
   kustomize build apps/argocd/argocd | yq -i 'with(.cluster.inlineManifests.[] | select(.name=="argocd"); .contents=load_str("/dev/stdin"))' infra/patches/argocd.yaml
   ```
2. Commit the changes and push to your repository.
3. Create Machine Classes
   ```shell
   cd omni/infra/
   omnictl apply -f machine-class-controlplane.yaml
   omnictl apply -f machine-class-worker.yaml
   ```
4. Create the cluster using the cluster template
   ```shell
   omnictl cluster template sync --file cluster-template.yaml
   ```