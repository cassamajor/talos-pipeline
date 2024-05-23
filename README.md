# Cluster Automation with Terraform
1. Fork [cassamajor/talos-pipeline](https://github.com/siderolabs/contrib/tree/main)
2. git clone your repository
3. `cd` into `terraform`
4. `terraform init`
5. `terraform plan -out tf.plan -target module.vmimport_role`
6. `terraform apply tf.plan`

# Prepare the Omni Image
1. Read the [Download Installation Media](https://omni.siderolabs.com/docs/tutorials/getting_started/#download-installation-media) section to download your Omni image.
2. Read the [Create your own AMIs](https://www.talos.dev/v1.6/talos-guides/install/cloud-platforms/aws/#create-your-own-amis) section to make your Omni image available to EC2 instances.
    - Skip the "Create the `vmimport` Role" section.
    - For the "Create the Image Snapshot" section, do not run the curl command. Run `xz -d OMNI_IMAGE > disk.raw`, where `OMNI_IMAGE` is the path to the Omni Image downloaded in Step 1. `
    - "Register the Image" is the last section. Do not "Create a Security Group".

# Create Machine Classes
```shell
cd examples/omni/infra/
omnictl apply -f machine-class-controlplane.yaml
omnictl apply -f machine-class-worker.yaml
```

# Create a Kubernetes Cluster
1. In your terminal, run
    - `terraform plan -out tf.plan`
    - `terraform apply tf.plan`
2. Read the [Cluster Example](https://omni.siderolabs.com/docs/tutorials/getting_started/#cluster-example) section to implement observability, monitoring, and application management.
